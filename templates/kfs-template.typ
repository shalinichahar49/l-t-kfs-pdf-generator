// ─────────────────────────────
//  kfs-template.typ
//  Key Facts Statement (Annexure 1)
// ─────────────────────────────

#import "../utils.typ": *

#let dash(x) = if x == none { "–" } else { x }

#let kfs_template(d) = [
  #align(center)[#underline[#text(weight: "bold", size: 11pt)[ANNEXURE 1 - KEY FACTS STATEMENT]]]

  #v(0.3cm)
  #align(center)[#underline[#text(weight: "bold", size: 11pt)[PART 1 (INTEREST RATE AND FEES/CHARGES)]]]

  #v(0.3cm)

  // Main KFS Table
  #table(
    columns: (0.5fr, 1.5fr, 1.5fr, 1.5fr, 1.5fr),
    stroke: 0.4pt,
    inset: 8pt,
    align: (left, left, left, left, left),
    
    // Row 1 - Loan proposal/account details
    [*1*], 
    [*Loan proposal/ account No.*], 
    [#dash(d.loan_application_no)],
    [*Type of Loan* \ Personal Loan ],
    [*Purpose of Loan* \ #dash(d.loan_purpose)],
    
    // Row 2 - Sanctioned Loan Amount (2 columns total)
    [*2*], 
    table.cell(colspan: 2)[*Sanctioned Loan Amount (in Rupees)* \ *Loan Amount (in Rupees)*], 
    table.cell(colspan: 2)[#money(d.sanctioned_amount) \ #money(d.disbursed_amount)],
    
    // Row 3 - Disbursal schedule (2 columns total)
    [*3*], 
    table.cell(colspan: 2)[*Disbursal schedule* \ (i) Disbursement in stages or 100% upfront. \ (ii) If it is stage wise, mention the clause of loan agreement having relevant details],
    table.cell(colspan: 2)[#align(horizon + center)[100% upfront]],
    
    // Row 4 - Loan term (2 columns total)
    [*4*], 
    table.cell(colspan: 2)[*Loan term (months)*], 
    table.cell(colspan: 2)[#dash(d.loan_term_months)],
    
    // Row 5 - Instalment details header
    [*5*], 
    table.cell(colspan: 4)[*Instalment details*],
    
    // Instalment details subheader (4 columns)
    [], 
    [Type of instalments], 
    [Number of EPIs], 
    [EPI (₹)],
    [Commencement of repayment, post sanction],
    
    // Instalment details data row (4 columns)
    [], 
    [Monthly], 
    [#dash(d.emi_count)],
    [#money(d.emi)],
    [#datestr(d.emi_start)],
    
    // Row 6 - Interest rate (2 columns total)
    [*6*], 
    table.cell(colspan: 2)[*Interest rate (Annualised)* \ *Type (fixed or floating or hybrid)*], 
    table.cell(colspan: 2)[*#money(d.interest_rate)% p.a.* \ *Fixed*],
    
    // Row 7 header
    [*7*], 
    table.cell(colspan: 4)[*Additional Information in case of Floating rate of interest*],
  )
  #block(spacing: 0pt, above: 0pt, below: 0pt)[
  #table(
    columns: (1fr, 1fr, 1fr, 1fr, 1fr, 1fr, 1fr, 1fr),
    stroke: 0.4pt,
    inset: 8pt,
    
    // Header row
    [Reference Benchmark], 
    [Benchmark rate (%) (B)], 
    [Spread (%) (S)], 
    [Final rate (%) R = (B) + (S)], 
    table.cell(colspan: 2, align: center)[Reset periodicity (Months)],
    table.cell(colspan: 2, align: center)[Impact of change in the reference benchmark (for 25 bps change in 'R', change in:)],
    
    // Sub-header row for both divided columns  
    [], [], [], [],
    [B], 
    [S],
    [EPI (₹)], 
    [No. of EPIs],
    
    // Data row
    [NA], [NA], [NA], [NA], [NA], [NA], [NA], [NA],
  )]
  #block(spacing: 0pt, above: 0pt, below: 0pt)[
  #table(
    columns: (0.5fr, 1fr, 1fr, 1fr, 1fr, 1fr),
    stroke: 0.4pt,
    inset: 8pt,
    align: (left, left, left, left, left, left),
    
    // Row 8 header
    [8], 
    table.cell(colspan: 5)[*Fee/ Charges*],
    
    // Main section headers
    [], 
    [],
    table.cell(colspan: 2, align: center)[Payable to the RE (A)], 
    table.cell(colspan: 2, align: center)[Payable to a third party through RE (B)],
    
    // Sub-headers
    [], 
    [],
    [One-Time/ Recurring], 
    [Amount (in ₹) or Percentage (%) as applicable],
    [One-Time/ Recurring], 
    [Amount (in ₹) or Percentage (%) as applicable],
    
    // (i) Processing fees
    [], 
    [(i) Processing fees], 
    [One Time],
    [#money(d.processing_fees)],
    [],
    [],
    
    // (ii) Insurance charges (no lines anywhere)
    table.cell(rowspan: 2)[], 
    table.cell(rowspan: 2)[(ii) Insurance charges \ a. Life Insurance \ b. Health Insurance \ c. General Insurance], 
    table.cell(rowspan: 2)[],
    table.cell(rowspan: 2)[],
    table.cell(rowspan: 2)[One Time],
    table.cell(rowspan: 2)[#align(horizon)[8225.00 \ 1100.00 \ 2250.00]],
    
    // Second row - all cells continue from rowspan above (no content needed)
    
    // Row 9 - APR (2 balanced columns)
    [9], 
    table.cell(colspan: 3)[*Annual Percentage Rate (APR) (%)*], 
    table.cell(colspan: 2)[#dash(d.apr)*% p.a.*],
    
    // Row 10 - Details of Contingent Charges header
    [10], 
    table.cell(colspan: 5)[*Details of Contingent Charges (in ₹ or %, as applicable)*],
    
    // (i) Penal charges
    [(i)], 
    table.cell(colspan: 2)[*Penal charges, if any, in case of delayed payment*], 
    table.cell(colspan: 3)[*2% per month on overdue EMI + applicable taxes*],
    
    // (ii) Other penal charges
    [(ii)], 
    table.cell(colspan: 2)[Other penal charges, if any], 
    table.cell(colspan: 3)[NA],
    
    // (iii) Foreclosure charges
    [(iii)], 
    table.cell(colspan: 2)[Foreclosure charges, if applicable], 
    table.cell(colspan: 3)[5% of principal outstanding + applicable taxes \ \* Foreclosure shall be allowed only after payment of 6 EMIs on the respective EMI due date],
    
    // (iv) Part Prepayment Charges
    [(iv)], 
    table.cell(colspan: 2)[Part Prepayment Charges], 
    table.cell(colspan: 3)[Up to 5% of prepaid amount + applicable taxes],
    
    // (v) Charges for switching
    [(v)], 
    table.cell(colspan: 2)[Charges for switching of loans from floating to fixed rate and vice versa], 
    table.cell(colspan: 3)[NA],
    
    // (vi) Duplicate NOC Charges
    [(vi)], 
    table.cell(colspan: 2)[Duplicate NOC Charges], 
    table.cell(colspan: 3)[Rs.250/- + applicable taxes],
    
    // (vii) Repayment Swap Charges
    [(vii)], 
    table.cell(colspan: 2)[Repayment Swap Charges (per swap)], 
    table.cell(colspan: 3)[Rs.500/- + applicable taxes (applicable only for branch walk-ins)],
    
    // (viii) Payment Mandate Dishonour/Bounce Charges - with nested table
    [(viii)], 
    table.cell(colspan: 2)[Payment Mandate Dishonour/Bounce Charges], 
    table.cell(colspan: 3)[
      #table(
        columns: (1fr, 1fr),
        stroke: 0.4pt,
        inset: 4pt,
        [*Loan Sanction amount in Rs.*], [*Charges in Rs.*],
        [< 5 Lacs], [500],
        [5 – 50 Lacs], [1000],
        [>50 Lacs – 2 Cr], [1500],
        [>2 Cr], [2000],
      )
    ],
    
    // (ix) Loan Cancellation Charges
    [(ix)], 
    table.cell(colspan: 2)[Loan Cancellation Charges post cooling off period of 3 days], 
    table.cell(colspan: 3)[5% + applicable taxes on the outstanding loan amount],
    
    // (x) Legal/Recovery Charges
    [(x)], 
    table.cell(colspan: 2)[Legal/Recovery Charges], 
    table.cell(colspan: 3)[As per actuals.],
  )]

  #pagebreak()

  #v(0.3cm)

  // PART 2 - Other Qualitative Information
  #align(center)[#underline[#text(size: 11pt)[*PART 2 - OTHER QUALITATIVE INFORMATION*]]]

  #v(0.3cm)

  // Part 2 Table
  #table(
    columns: (0.5fr, 2.5fr, 3fr),
    stroke: 0.4pt,
    inset: 8pt,
    align: (left, left, left),
    
    // Row 1 - Recovery agents
    [1], 
    [Clause of Loan agreement relating to engagement of recovery agents], 
    [In the event of default, the Lender shall communicate to the Borrower by way of SMS or Email the details of recovery agent who is authorised by the Lender to approach the Borrower for recovery of Loan.],
    
    // Row 2 - Grievance redressal
    [2], 
    [Clause of Loan agreement which details grievance redressal mechanism], 
    [The Lender has designated a grievance redressal officer to redress the grievances of the Borrower. The details of the grievance redressal mechanism and the grievance redressal officer will be provided in the Schedule of the Loan Agreement. \ For further details, refer to the GRO Link: \ #text(fill: blue)[https://www.ltfs.com/grievance-redressal]],
    
    // Row 3 - Contact details
    [3], 
    [Phone number and email id of the nodal grievance redressal officer], 
    [#text(fill: blue)[gro\@ltfs.com \ 1800 1020 476]],
    
    // Row 4 - Transfer possibility
    [4], 
    [Whether the loan is, or in future maybe, subject to transfer to other REs or securitisation (Yes/No)], 
    [Yes],
    
    // Row 5 - Collaborative lending
    [5], 
    table.cell(colspan: 2)[In case of lending under collaborative lending arrangements (e.g., co-lending/ outsourcing), following additional details may be furnished:],
    
    // Row 5 sub-table
    [], 
    table.cell(colspan: 2)[
      #table(
        columns: (1fr, 1fr, 1fr),
        stroke: 0.4pt,
        inset: 4pt,
        [Name of the originating RE, along with its funding proportion], 
        [Name of the partner RE along with its proportion of funding], 
        [Blended rate of interest],
        [NA], [NA], [NA],
      )
    ],
    
    // Row 6 - Digital loans header
    [6], 
    table.cell(colspan: 2)[In case of digital loans, following specific disclosures may be furnished:],
    
    // Row 6 (i) - Cooling off period
    [], 
    [(i) Cooling off/look-up period, in terms of RE's board approved policy, during which borrower shall not be charged any penalty on prepayment of loan], 
    [3 days],
    
    // Row 6 (ii) - LSP details
    [], 
    [(ii) Details of LSP acting as recovery agent and authorized to approach the borrower], 
    [Will be provided when loan default occurs],
  )

  #pagebreak()
]