"""Tests for human-facing Mersearch local service and public source boundaries."""
from __future__ import annotations
import http.server
import json
import sys
import tempfile
import threading
import unittest
from pathlib import Path
from urllib.error import HTTPError
from urllib.request import Request, urlopen

ROOT=Path(__file__).resolve().parents[2]
sys.path.insert(0,str(ROOT/"tools"))
import serve_mersearch_ui as ui


class PolicyTests(unittest.TestCase):
    def test_request_validation(self):
        self.assertEqual(ui.SearchService.validate({
            "expr":"0.24","sort":"origin","result_mode":"files","offset":20,"limit":20,
        }),("0.24","origin","files",20,20))
        for request in (
            {"expr":""},{"expr":"x","limit":500},
            {"expr":"helix NEAR/300 spin"},{"expr":"x","offset":-1},
            {"expr":"x","sort":"arbitrary"},{"expr":"x","roots":["/private"] ,"limit":0},
        ):
            with self.assertRaises(ValueError):
                ui.SearchService.validate(request)
        # Caller-supplied "roots" cannot override the service-side source list.
        expr,*_=ui.SearchService.validate({"expr":"0.24","roots":["/private"]})
        self.assertEqual(expr,"0.24")

    def test_public_allowlist(self):
        with tempfile.TemporaryDirectory() as d:
            home=Path(d)
            (home/"SAT_THEORY_ARCHIVE_2023-25").mkdir()
            (home/"HSH_RESOURCES").mkdir()
            (home/"HSH_RESOURCES"/"secret.txt").write_text("never-public")
            public=ui.SearchService("public",home)
            private=home/"HSH_RESOURCES"
            self.assertTrue(all(private not in p.parents and p!=private for p in public.roots))
            self.assertNotIn("Satobloc/HSH_RESOURCES",public.repositories)
            self.assertIn("Satobloc/SAT_THEORY_ARCHIVE_2023-25",public.repositories)
            self.assertEqual(public.coverage()["coverage_status"],"partial")
            local=ui.SearchService("research",home)
            self.assertIn("Satobloc/HSH_RESOURCES",local.repositories)

    def test_real_engine_public_search_excludes_private_sources(self):
        # Runs the actual search executable against a small three-repo fixture.
        # Patch only the known installation root, never HTTP request parameters.
        with tempfile.TemporaryDirectory() as d:
            home=Path(d)
            sat=home/"SAT_THEORY_ARCHIVE_2023-25"
            hsh=home/"HsH"
            resources=home/"HSH_RESOURCES"
            for folder in (sat,hsh,resources):folder.mkdir()
            (sat/"phase.txt").write_text("SAT Mark V optical phase shift 0.24",encoding="utf-8")
            (hsh/"README.md").write_text("Public research note: 0.24",encoding="utf-8")
            (hsh/"WORKSPACES"/"PRIVATE").mkdir(parents=True)
            (hsh/"WORKSPACES"/"PRIVATE"/"secret.txt").write_text("Hidden 0.24",encoding="utf-8")
            (resources/"secret.txt").write_text("Private calculation 0.24",encoding="utf-8")
            previous=ui.REPO
            try:
                ui.REPO=hsh
                service=ui.SearchService("public",home)
                data=service.search({"expr":'"0.24"',"limit":20})
                self.assertEqual(data["pagination"]["total_hits"],2)
                self.assertEqual(len(data["hits"]),2)
                self.assertTrue(all("secret.txt" not in hit["path"] for hit in data["hits"]))
                self.assertEqual(set(hit["repository"] for hit in data["hits"]),
                    {"Satobloc/SAT_THEORY_ARCHIVE_2023-25","Satobloc/HsH"})
                self.assertTrue(all("github.com/Satobloc/" in hit["source_url"] for hit in data["hits"]))
                self.assertTrue(any(hit["source_url"].endswith("/README.md") for hit in data["hits"]))
            finally:
                ui.REPO=previous

    def test_cached_pagination_and_provenance(self):
        with tempfile.TemporaryDirectory() as d:
            service=ui.SearchService("research",Path(d))
            calls=[]
            def fixture(expr,sort,mode):
                calls.append((expr,sort,mode))
                return {
                    "query":expr,"coverage":{},"hits":[
                        {"path":str(i),"excerpt":"phase shift "+str(i),"repository":"Satobloc/HsH"}
                        for i in range(47)]
                }
            service._scan=fixture
            p1=service.search({"expr":'"phase shift"',"limit":20})
            p2=service.search({"expr":'"phase shift"',"limit":20,"offset":20})
            self.assertEqual(len(calls),1)
            self.assertEqual(p1["pagination"]["total_hits"],47)
            self.assertEqual(p2["hits"][0]["path"],"20")
            self.assertEqual(len(p2["hits"]),20)
            self.assertEqual(p1["coverage_status"],"partial")
            self.assertNotIn("Satobloc/HSH_RESOURCES",p1["archives_searched"])


class BrowserApiTests(unittest.TestCase):
    def setUp(self):
        self.temp=tempfile.TemporaryDirectory()
        self.addCleanup(self.temp.cleanup)
        service=ui.SearchService("public",Path(self.temp.name))
        service._scan=lambda expr,sort,mode:{
            "query":expr,"hits":[{"title":"Verified phase note","path":"public_note.txt",
              "repository":"Satobloc/SAT_THEORY_ARCHIVE_2023-25","excerpt":"0.24 radians"}]
        }
        class Handler(ui.Handler):
            pass
        Handler.service=service
        self.server=http.server.ThreadingHTTPServer(("127.0.0.1",0),Handler)
        self.addCleanup(self.server.server_close)
        self.thread=threading.Thread(target=self.server.serve_forever,daemon=True)
        self.thread.start()
        self.addCleanup(self.server.shutdown)
        self.origin="http://127.0.0.1:"+str(self.server.server_port)

    def fetch(self,path="/api/capabilities",method="GET",body=None,headers=None):
        data=json.dumps(body).encode() if body is not None else None
        req=Request(self.origin+path,data=data,
                    headers=headers or {},method=method)
        return urlopen(req,timeout=5)

    def test_ui_served_and_capabilities(self):
        with self.fetch("/") as response:
            html=response.read().decode()
            self.assertIn("Find the",html)
            self.assertIn("mersearch.js",html)
            self.assertEqual(response.headers["X-Content-Type-Options"],"nosniff")
        with self.fetch("/api/capabilities") as response:
            data=json.load(response)
            self.assertEqual(data["profile"],"public")
            self.assertIn("version",data["capabilities"]["fields"])

    def test_api_search(self):
        with self.fetch("/api/search","POST",{
            "expr":'"0.24"',"limit":20,"offset":0},
            {"Content-Type":"application/json","Origin":self.origin}
        ) as response:
            result=json.load(response)
        self.assertEqual(result["pagination"]["total_hits"],1)
        self.assertEqual(result["hits"][0]["title"],"Verified phase note")
        self.assertNotIn("Satobloc/HSH_RESOURCES",result["archives_searched"])

    def test_dns_rebinding_host_is_denied(self):
        port = self.server.server_port
        with self.assertRaises(HTTPError) as ctx:
            self.fetch("/api/capabilities",headers={"Host":f"evil.example:{port}"})
        self.assertEqual(ctx.exception.code,403)
        with self.assertRaises(HTTPError) as ctx:
            self.fetch("/api/search","POST",{"expr":"0.24"},
                       {"Content-Type":"application/json","Host":f"evil.example:{port}"})
        self.assertEqual(ctx.exception.code,403)

    def test_cross_site_request_is_denied(self):
        with self.assertRaises(HTTPError) as ctx:
            self.fetch("/api/search","POST",{"expr":"0.24"},
                       {"Content-Type":"application/json","Origin":"https://attacker.example"})
        self.assertEqual(ctx.exception.code,403)


if __name__=="__main__":
    unittest.main()
