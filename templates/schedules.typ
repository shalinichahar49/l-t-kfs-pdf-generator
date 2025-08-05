// ─────────────────────────────
//  schedules.typ
//  Schedule A (APR) and Schedule B (Repayment) templates
// ─────────────────────────────

#import "../utils.typ": *

#let dash(x) = if x == none { "–" } else { x }

#let schedule_a(d) = [
  // Schedule A - APR Computation
  #align(center)[#underline[#text(weight: "bold", size: 11pt)[SCHEDULE A - COMPUTATION OF APR]]]

  #v(0.3cm)

  #table(
    columns: (0.8fr, 4fr, 2fr),
    stroke: 0.4pt,
    inset: 8pt,
    align: (left, left, left),
    
    [*Sr. No.*], [*Parameter*], [*Details*],
    
    // Row 1 - Loan amount
    [1], [Loan amount (in Rupees)], [#money(d.disbursed_amount)],
    
    // Row 2 - Loan Term
    [2], [Loan Term (months)], [#dash(d.loan_term_months)],
    
    // Row a) - No. of instalments for principal
    [a)], [No. of instalments for payment of principal, in case of non-equated periodic loans], [NA],
    
    // Row b) - Type of EPI (split into sub-rows)
    [b)], [Type of EPI], [Monthly],
    
    [], [Amount of each EPI (in Rupees)], [#money(d.emi)],
    
    [], [Nos. of EPIs], [#dash(d.emi_count)],
    
    // Row c) - Capitalised interest
    [c)], [No. of instalments for payment of capitalised interest, if any], [NA],
    
    // Row d) - Commencement
    [d)], [Commencement of repayments, post sanction], [#datestr(d.emi_start)],
    
    // Row 3 - Interest rate type
    [3], [Interest rate type (fixed or floating or hybrid)], [Fixed],
    
    // Row 4 - Interest rate
    [4], [Interest rate (Annualised)], [#money(d.interest_rate) % p.a],
    
    // Row 5 - Total Interest Amount
    [5], [Total Interest Amount to be charged during the entire tenor of the loan as per the rate prevailing on sanction date (in Rupees)], [#money(d.total_interest)],
    
    // Row 6 - Fee/Charges header
    [6], [Fee/ Charges payable (in Rupees)], [#money(d.fees_total)],
    
    // Row A - Payable to RE
    [A], [Payable to the RE], [#money(d.processing_fees)],
    
    // Row B - Payable to third party
    [B], [Payable to third-party routed through RE], [#money(d.payable_to_third_party)],
    
    // Row C - Total Outstanding
    [C], [Total Outstanding from previous loan], [NA],
    
    // Row 7 - Net Disbursed
    [7], [Net Disbursed amount (in Rupees)], [#money(d.net_disbursed)],
    
    // Row 8 - Total amount to be paid
    [8], [Total amount to be paid by the borrower (in Rupees)], [#money(d.total_payable)],
    
    // Row 9 - APR
    [9], [Annual Percentage Rate - Effective annualized interest rate (in percentage)], [#dash(d.apr) % p.a],
    
    // Row 10 - Schedule of disbursement
    [10], [Schedule of disbursement as per terms and conditions], [One-time disbursement],
    
    // Row 11 - Due date
    [11], [Due date of payment of instalment and interest], [#datestr(d.emi_start) and monthly thereafter],
  )

  #v(0.3cm)
]

#let schedule_b_full(d) = [

  // Header with logo and blue line
  #grid(
    columns: (1fr, auto),
    align: (left, right),
    [],
    [#image("../assets/logos/lt-finance-official.svg", width: 100pt)]
  )
  
  #v(-0.1cm)
  // Blue horizontal line (reduced width, right aligned)
  #align(right)[#line(length: 80%, stroke: 2pt + rgb("#00a3da"))]
  
  #v(0.1cm)

  // Schedule B - Full Repayment Schedule (with line break)
  #align(center)[#underline[#text(weight: "bold", size: 11pt)[SCHEDULE B – \ REPAYMENT SCHEDULE UNDER EQUATED PERIODIC INSTALLMENT]]]

  #v(0.3cm)

  #grid(
    columns: (1fr, 1fr),
    column-gutter: 1cm,
    
    // Left table
    table(
      columns: (2fr, 1fr),
      stroke: 0.4pt,
      inset: 8pt,
      align: (left, left),
      
      [Annual interest rate], [#money(d.interest_rate)],
      [Loan term (in years)], [#calc.round(d.loan_term_months / 12, digits: 1)],
      [Payments per year], [12],
      [Loan amount], [#money(d.disbursed_amount)],
    ),
    
    // Right table  
    table(
      columns: (2fr, 1fr),
      stroke: 0.4pt,
      inset: 8pt,
      align: (left, left),
      
      [Total payments], [#money(d.total_payable)],
      [Total interest], [#money(d.total_interest)],
    )
  )

  #v(0.3cm)
]


#let schedule_b_short(d) = [

  #table(
    columns: (0.8fr, 1.4fr, 1.4fr, 1.4fr, 1.6fr), 
    stroke: 0.4pt,
    fill: (_, y) => if y == 0 { gray.lighten(40%) },
    
    [*Period*], [*EMI*], [*Interest*], [*Principal*], [*Balance*],
    
    ..for entry in d.repayment_schedule {
      ([#entry.period], [#money_clean(entry.emi)], [#money_clean(entry.interest)], [#money_clean(entry.principal)], [#money_clean(entry.balance)])
    }
  )
]


