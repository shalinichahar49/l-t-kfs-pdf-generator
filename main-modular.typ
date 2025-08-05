// -----------------------------------------------------------------------------
// L&T FINANCIAL SERVICES – SANCTION LETTER + KEY FACT STATEMENT (KFS)
// MODULARIZED VERSION - Compatible with Typst ≥ 0.13.x (tested on 0.13.1)
// Updated to use separate template files for better organization
// -----------------------------------------------------------------------------

// Import utilities and template modules
#import "utils.typ": *
#import "templates/page-setup.typ": *
#import "templates/sanction-letter.typ": *
#import "templates/kfs-template.typ": *
#import "templates/schedules.typ": *
#import "templates/terms-conditions.typ": *

// Load data from YAML
#let d = yaml(sys.inputs.data)

// Apply page setup for first page
#set page("a4", margin: (x: 1.5cm, top: 1.5cm, bottom: 0.1cm))
#set text(font: "Times New Roman", size: 10pt)
#set page(header: none)
#set page(footer: none)

// =============================================================================
// DOCUMENT STRUCTURE
// =============================================================================

// Page 1: Sanction Letter (with 1.5cm margins)
#sanction_letter(d)

// Change margins for rest of the pages (0.5cm)
#set page(margin: (x: 0.5cm, top: 1.5cm, bottom: 0.5cm))

// Annexure 1: Key Facts Statement
#kfs_template(d)

// Schedule A: APR Computation
#schedule_a(d)

// Annexure 2: Terms and Conditions
#terms_conditions(d)

// Schedule B: Full Repayment Schedule
#schedule_b_full(d)

// Schedule B: Short Repayment Schedule
#schedule_b_short(d)

// -----------------------------------------------------------------------------
//  END OF DOCUMENT
// -----------------------------------------------------------------------------