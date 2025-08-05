# Adding Graphics to L&T KFS PDF Generator

## Overview
This guide shows you how to add various types of graphics to your Key Fact Statement (KFS) PDF documents generated with Typst.

## Quick Start

### 1. Basic Image Addition
```typst
#import image: *

// Add a logo
#image("assets/logos/company-logo.png", width: 3cm)

// Add an icon
#image("assets/icons/user-icon.svg", width: 0.5cm)
```

### 2. Header/Footer Graphics
```typst
// Header with logo
#set page(header: align(center)[
  #image("assets/logos/header-logo.png", width: 2cm)
  #text(weight: "bold")[Company Name]
])

// Footer with graphics
#set page(footer: align(center)[
  #text(size: 8pt)[Page #context counter(page).display()]
  #image("assets/security/footer-seal.png", width: 1cm)
])
```

## Types of Graphics for KFS Documents

### 1. Company Logos
- **Main Logo**: Large logo at the top of the document
- **Header Logo**: Smaller logo in the page header
- **Footer Logo**: Logo in the page footer

### 2. Section Icons
- User profile icons for borrower details
- Phone icons for contact information
- Address icons for location details
- Financial icons for loan details

### 3. Security Features
- QR codes for document verification
- Digital signatures
- Watermarks
- Security seals

### 4. Decorative Elements
- Colored table headers
- Border graphics
- Background patterns
- Divider lines

## File Structure
```
lnt-kfs-pdf-generator/
├── assets/
│   ├── logos/
│   │   ├── lt-logo.png          # Main company logo
│   │   ├── lt-logo-small.png    # Small header logo
│   │   └── lt-logo-footer.png   # Footer logo
│   ├── icons/
│   │   ├── user-icon.svg        # User profile icon
│   │   ├── phone-icon.svg       # Phone icon
│   │   ├── email-icon.svg       # Email icon
│   │   ├── address-icon.svg     # Address icon
│   │   └── loan-icon.svg        # Loan icon
│   ├── watermarks/
│   │   └── watermark.png        # Background watermark
│   └── security/
│       ├── qr-code.png          # QR code for verification
│       ├── digital-signature.png # Digital signature
│       └── security-seal.png    # Security seal
├── main.typ                     # Main document template
├── main-with-graphics.typ       # Enhanced version with graphics
├── data.yml                     # Sample data
└── generate.py                  # Batch generation script
```

## Implementation Examples

### Example 1: Basic Logo Addition
```typst
// Add company logo at the top
#align(center)[
  #image("assets/logos/lt-logo.png", width: 4cm)
  #v(0.5em)
  #text(weight: "bold", size: 16pt)[L&T Financial Services Limited]
]
```

### Example 2: Enhanced Tables with Icons
```typst
#table(
  columns: (0.3fr, 1fr, 2fr),
  stroke: 0.5pt,
  [*#image("assets/icons/user-icon.svg", width: 0.5cm)*], [*Name*], [#data.borrower_name],
  [*#image("assets/icons/phone-icon.svg", width: 0.5cm)*], [*Mobile*], [#data.mobile],
  [*#image("assets/icons/email-icon.svg", width: 0.5cm)*], [*Email*], [#data.email],
)
```

### Example 3: Colored Table Headers
```typst
#table(
  columns: (1fr, 1fr),
  stroke: 0.5pt,
  fill: (row, col) => if row == 0 { rgb(240, 248, 255) } else { white },
  [*Loan Type*], [#data.loan_type],
  [*Loan Amount*], [₹#money(data.sanctioned_amount)],
)
```

### Example 4: Decorative Borders
```typst
#box(
  stroke: 2pt + blue,
  inset: 0.5cm,
  radius: 0.2cm,
  fill: rgb(248, 248, 255),
  [
    #align(center)[
      #text(size: 10pt)[*This document is computer generated*]
    ]
  ]
)
```

### Example 5: Watermarks
```typst
#watermark(
  #image("assets/watermarks/watermark.png", width: 10cm),
  angle: 45deg,
  opacity: 0.1
)
```

## Image Format Recommendations

### For Logos
- **Format**: PNG with transparency
- **Resolution**: 300 DPI for print quality
- **Size**: Keep under 500KB for performance

### For Icons
- **Format**: SVG (scalable) or PNG
- **Size**: 16x16 to 64x64 pixels
- **Style**: Simple, monochrome

### For Security Features
- **Format**: PNG or SVG
- **Resolution**: 300 DPI
- **Size**: Appropriate for the feature

## Best Practices

### 1. File Organization
- Keep all graphics in the `assets/` directory
- Use descriptive file names
- Organize by type (logos, icons, etc.)

### 2. Performance
- Optimize image file sizes
- Use appropriate formats (SVG for icons, PNG for logos)
- Keep total graphics under 2MB per document

### 3. Accessibility
- Provide alt text for important graphics
- Ensure sufficient contrast
- Don't rely solely on graphics for information

### 4. Branding
- Use consistent colors and styles
- Follow company brand guidelines
- Maintain professional appearance

## Troubleshooting

### Common Issues

1. **Image not found**
   - Check file path is correct
   - Ensure image file exists
   - Verify file permissions

2. **Image too large/small**
   - Adjust width/height parameters
   - Use appropriate units (cm, mm, pt)

3. **Poor image quality**
   - Use higher resolution source images
   - Ensure 300 DPI for print quality

4. **Slow PDF generation**
   - Optimize image file sizes
   - Use appropriate formats
   - Consider caching for repeated images

### Debugging Tips
```typst
// Test image loading
#image("path/to/image.png", width: 1cm)

// Check if image exists
#if file.exists("path/to/image.png") {
  #image("path/to/image.png", width: 1cm)
} else {
  #text[Image not found]
}
```

## Advanced Features

### 1. Dynamic Graphics
```typst
// Show different logos based on loan type
#if data.loan_type == "Personal Loan" {
  #image("assets/logos/personal-loan-logo.png", width: 3cm)
} else {
  #image("assets/logos/business-loan-logo.png", width: 3cm)
}
```

### 2. QR Code Generation
```typst
// Generate QR code for document verification
#let qr_data = "https://verify.ltfs.com/doc/" + data.loan_application_no
#image("assets/qr-codes/" + data.loan_application_no + ".png", width: 2cm)
```

### 3. Watermarking
```typst
// Add watermark based on document status
#if data.status == "Draft" {
  #watermark(
    #text(weight: "bold", size: 48pt)[DRAFT],
    angle: 45deg,
    opacity: 0.3
  )
}
```

## Testing Your Graphics

1. **Test individual images**
   ```bash
   typst c test-image.typ test.pdf --input data=data.yml
   ```

2. **Test with sample data**
   ```bash
   typst c main-with-graphics.typ test-graphics.pdf --input data=data.yml
   ```

3. **Batch test with multiple files**
   ```bash
   python generate.py sample-data.csv --template main-with-graphics.typ --out test-output
   ```

## Resources

- [Typst Image Documentation](https://typst.app/docs/reference/visualize/image/)
- [SVG Optimization Tools](https://jakearchibald.github.io/svgomg/)
- [PNG Optimization](https://tinypng.com/)
- [Color Palette Tools](https://coolors.co/)

## Support

For issues with graphics implementation:
1. Check the troubleshooting section above
2. Verify file paths and permissions
3. Test with simple examples first
4. Consult the Typst documentation 