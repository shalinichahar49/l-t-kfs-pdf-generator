// ─────────────────────────────
//  sanction-letter.typ
//  Sanction letter template (Page 1)
// ─────────────────────────────

#import "../utils.typ": *

#let sanction_letter(d) = [
  // Header with logo and blue line
  #grid(
    columns: (1fr, auto),
    align: (left, right),
    [],
    [#image("../assets/logos/lt-finance-official.svg", width: 120pt)]
  )
  
  #v(-0.1cm)
  // Blue horizontal line
  #line(length: 100%, stroke: 3pt + rgb("#00a3da"))
  
  #v(0.1cm)
  #align(center)[#underline[#text(weight: "bold", size: 11pt)[SANCTION LETTER]]]
  
  #v(0.1cm)
  #align(center)[#underline[#text(weight: "bold", size: 11pt)[LOAN APPLICATION NUMBER: #dash(d.loan_application_no)]]]

  #v(0.5cm)
  Date: #datestr(d.sanction_date)

  #v(0.1cm)
  To, \
  #dash(d.borrower_name) \
  Current Address: #dash(d.current_address) 
  Permanent Address: #dash(d.permanent_address) 
  Email id: #dash(d.email) \
  Mobile Number: #dash(d.mobile)

  #v(0.1cm)
  Dear Sir / Madam,

  #v(0.05cm)
  We are pleased to inform you that your loan application has been approved by L&T Finance Limited #emph[(formerly known as L&T Finance Holdings Limited)], and hereinafter referred as (*"LTF/Lender"*), subject to the following:

      #box(
  inset: (left: 1cm),
  [
    1) #underline[#text(weight: "bold")[Key Facts Statement]] - Please find attached Annexure 1 which comprises of Key Facts Statement (*"KFS"*). Annexure 1 further comprises of Schedule A i.e. Computation of Annual Percentage Rate (APR) and Schedule B i.e. Repayment Schedule.

    2) #underline[#text(weight: "bold")[Terms and Conditions]] - Please find attached Annexure 2 which comprises of Terms of Sanction.
  ]
)

  We look forward to a mutually beneficial and long-term relationship. We believe that our partnership will be built on the principles of trust, transparency, and understanding. We are committed to providing you with the best possible service and support to ensure that your loan experience is smooth and hassle-free.

  By consenting to this sanction letter, you acknowledge that you have read, understood, and agreed to the terms and conditions outlined above and in the Annexures. You also confirm that you have provided all necessary information and documentation to facilitate the disbursement of the loan.

  We encourage you to reach out to us if you have any questions or concerns regarding your loan or any other matter. Our dedicated customer service team is available at 1800-268-0000 or #link("mailto:customercare@ltfs.com")[#text(fill: blue)[customercare\@ltfs.com]] to assist you at all times.

  If you're agreeable to the above terms and conditions, please sign and accept this sanction letter.

  Date: #if d.sanction_date != none [#datestr(d.sanction_date)] else [#datetime.today().display("[day] [month repr:short] [year]")] #if "sanction_time" in d and d.sanction_time != none [#d.sanction_time] else [12:38 pm]

  #v(0.5cm)

  Regards,\
  #v(0.05cm)
  *L&T Finance Ltd.*\
  #emph[(formerly known as L&T Finance Holdings Limited)]

  #v(0.5cm)
  #align(center)[#text(size: 6pt, fill: gray.darken(30%))[This is a system generated document. Therefore, the signature of L&T Finance Limited is not required.]]

  #v(1cm)

  #line(length: 100%, stroke: 0.5pt)
  #v(0.1cm)
  #grid(
    columns: (1fr, 1fr),
    column-gutter: 5.5cm,

    // Left column - Company info
    [
    #box(inset: (x: 1.3cm))[
      #text(size: 6pt)[
        *L&T Finance Limited*\
        #emph[(formerly known as L&T Finance Holdings Limited)]\
        *Registered Office*\ 
        Brindavan, Plot No. 177,\
        C.S.T Road, Kalina,\
        Santacruz (East), Mumbai,\
        Maharashtra - 400098, India
      ]
    ]
  ],

  // Right column - Contact info
  [
    #box(inset: (x: 0.3cm))[
      #text(size: 6pt)[
        Contact No.: 1800-268-0000\
        Email: customercare\@ltfs.com\
        Website: www.ltfs.com\
        CIN: L67120MH2008PLC181833
      ]
    ]
  ]
)


  #v(0.05cm)
  #align(center)[#text(size: 6pt)[*\*All loans originated and serviced by and at the discretion of L&T Finance Limited*]]

  #pagebreak()
]