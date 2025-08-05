// ─────────────────────────────
//  page-setup.typ
//  Page styling and layout configuration
// ─────────────────────────────

#let setup_page() = {
  // Page configuration - smaller margins and font size
  set page("a4", margin: (x: 1.5cm, y: 0.5cm))
  set text(font: "Times New Roman", size: 9pt)
  
  // Header and footer
  set page(header: align(center)[L&T Finance Limited])
  set page(footer: align(center)[Page #context counter(page).display()])
}