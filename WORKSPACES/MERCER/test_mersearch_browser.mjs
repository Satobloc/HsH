/* Browser acceptance for the public GitHub Pages-style Mersearch snapshot.
 * Requires: npm install --no-save playwright@1.56.1
 *            npx playwright install chromium
 * Run with a local static server: MERSEARCH_BASE=http://127.0.0.1:8977 node thisfile
 */
import assert from 'node:assert/strict';
import fs from 'node:fs';
import path from 'node:path';
import { chromium } from 'playwright';

const base = process.env.MERSEARCH_BASE || 'http://127.0.0.1:8977';
const folder = process.env.MERSEARCH_SCREENSHOTS || '/tmp/mersearch-screenshots';
fs.mkdirSync(folder,{recursive:true});
const errors = [];
const browser = await chromium.launch({headless:true});
let pages = 0;
try {
  for (const device of [
    {name:'desktop', viewport:{width:1440,height:960}},
    {name:'mobile', viewport:{width:390,height:844},isMobile:true,hasTouch:true}
  ]) {
    const context = await browser.newContext({
      viewport:device.viewport,isMobile:!!device.isMobile,hasTouch:!!device.hasTouch,
      deviceScaleFactor:1,reducedMotion:'reduce'
    });
    const page = await context.newPage();
    page.on('pageerror',e=>errors.push(device.name+': '+e.message));
    const navigation=await page.goto(base,{waitUntil:'domcontentloaded'});
    assert.equal(navigation.status(),200);
    await page.waitForFunction(()=>document.querySelector('#connectionState')
      ?.textContent?.includes('Public catalog search'),{timeout:16000});
    await page.screenshot({path:path.join(folder,device.name+'-landing.png'),fullPage:true});
    assert.ok((await page.locator('#scopeHeadline').innerText()).includes('CATALOG'));
    assert.equal(await page.locator('[data-querymode="math"]').isDisabled(),true);
    await page.locator('#searchQuery').fill('SAT');
    await page.locator('#searchButton').click();
    await page.locator('#resultHeading').waitFor();
    const header=await page.locator('#resultHeading').innerText();
    assert.match(header, /result/);
    const cards=await page.locator('.result-card').count();
    assert.ok(cards>0,'Expected matching public conversation titles for SAT');
    assert.match(await page.locator('#resultSubheading').innerText(), /titles and paths only/);
    await page.screenshot({path:path.join(folder,device.name+'-results.png'),fullPage:true});
    const sourceEvidence=page.locator('.result-card .result-foot button').first();
    await sourceEvidence.click();
    assert.equal(await page.locator('.result-card .provenance').first().isVisible(),true);
    await page.locator('[data-view="timeline"]').click();
    assert.equal(await page.locator('#timelinePanel').isVisible(),true);
    await page.locator('[data-view="results"]').click();
    await page.locator('#helpOpen').click();
    assert.equal(await page.locator('#helpDialog').isVisible(),true);
    await page.locator('#helpDialog [data-close-dialog]').last().click();
    assert.equal(await page.locator('#helpDialog').isVisible(),false);
    assert.ok(await page.evaluate(()=>document.documentElement.scrollWidth<=innerWidth+1),
      'Unexpected horizontal page overflow');
    pages++;
    await context.close();
  }
  assert.deepEqual(errors,[]);
  console.log('BROWSER_QA_PASS '+JSON.stringify({pages,screenshots:folder,errors}));
} finally {
  await browser.close();
}
