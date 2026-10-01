#!/usr/bin/env python3

from pathlib import Path
from datetime import datetime
import os
import sys
from tempfile import NamedTemporaryFile

from pypdf import PdfReader, PdfWriter
from reportlab.pdfgen import canvas
from reportlab.lib.pagesizes import letter


def mac_creation_date(path: Path) -> str:
    """
    On macOS, st_birthtime is the file creation time.
    If unavailable, fall back to modified time.
    """
    stat = path.stat()
    timestamp = getattr(stat, "st_birthtime", stat.st_mtime)
    return datetime.fromtimestamp(timestamp).strftime("%Y-%m-%d %H:%M:%S")


def make_divider_page(pdf_path: Path, created: str) -> Path:
    temp = NamedTemporaryFile(delete=False, suffix=".pdf")
    temp.close()

    c = canvas.Canvas(temp.name, pagesize=letter)
    width, height = letter

    c.setFont("Helvetica-Bold", 18)
    c.drawCentredString(width / 2, height - 220, "PDF Divider")

    c.setFont("Helvetica", 12)
    c.drawCentredString(width / 2, height - 270, f"File: {pdf_path.name}")
    c.drawCentredString(width / 2, height - 295, f"Created: {created}")

    c.setFont("Helvetica", 10)
    c.drawCentredString(width / 2, 80, "=" * 70)

    c.showPage()
    c.save()

    return Path(temp.name)


def main():
    folder = Path(sys.argv[1]) if len(sys.argv) > 1 else Path(".")
    output = Path(sys.argv[2]) if len(sys.argv) > 2 else 
Path("combined.pdf")

    pdf_files = sorted(
        p for p in folder.glob("*.pdf")
        if p.name != output.name and not p.name.startswith(".")
    )

    if not pdf_files:
        print("No PDF files found.")
        return

    writer = PdfWriter()
    temp_dividers = []

    for pdf in pdf_files:
        created = mac_creation_date(pdf)

        divider = make_divider_page(pdf, created)
        temp_dividers.append(divider)

        divider_reader = PdfReader(str(divider))
        for page in divider_reader.pages:
            writer.add_page(page)

        reader = PdfReader(str(pdf))
        for page in reader.pages:
            writer.add_page(page)

    with open(output, "wb") as f:
        writer.write(f)

    for temp in temp_dividers:
        try:
            os.remove(temp)
        except OSError:
            pass

    print(f"Done: {output}")


if __name__ == "__main__":
    main()
