# Save a paper or follow-up for automatic website display

The standard is `PUBLIC_SITE/PAPERS/README.md`. Save the typeset, visually checked PDF and the small publication JSON together in one commit. Every registered paper automatically supports ordered addenda in its own `addenda/` folder. No manual Sites deployment or intake packet is required. Draft metadata uses `published: false`; public display requires `published: true`. Do not substitute a raw Markdown/LaTeX/source file for the PDF.

Crullerverse: `PUBLIC_SITE/PAPERS/cruller-rubin/`. Follow-up metadata must use `parent_id: cruller-rubin` and a unique positive `sequence`.
