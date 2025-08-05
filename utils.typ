// ─────────────────────────────
//  utils.typ
// ─────────────────────────────

#import calc: *

// money(value)
// • Accepts number or string (or none)
// • Returns "–" if blank, otherwise formatted number with 2 decimals
#let money(v) = {
  if v == none { "–" } else {
    let n = if type(v) == "str" { num(v) } else { v }
    let r = round(n * 100) / 100
    let s = str(r)
    if not s.contains(".") { s = s + ".00" }
    else {
      let p = s.split(".")
      let intp = p.at(0)
      let frac = p.at(1)
      if frac.len() == 0 { s = intp + ".00" }
      if frac.len() == 1 { s = intp + "." + frac + "0" }
      if frac.len() > 2 { s = intp + "." + frac.slice(0, 2) }
    }
    s
  }
}

// date(str)
// • Handles "DD/MM/YYYY" or "YYYY-MM-DD"
// • Returns "DD/MM/YYYY" or falls back unchanged
#let date(s) = {
  if s == none { "–" } else {
    let by_slash = s.split("/")
    if by_slash.len() == 3 {
      s                           // already in desired format
    } else {
      let by_dash = s.split("-")
      if by_dash.len() == 3 {
        // reorder YYYY-MM-DD → DD/MM/YYYY
        by_dash.at(2) + "/" + by_dash.at(1) + "/" + by_dash.at(0)
      } else {
        s                         // unknown pattern; return as-is
      }
    }
  }
}

// datestr(raw) - alias for date() to match main.typ naming
#let datestr(raw) = date(raw)

// money_clean(value)
// • Like money() but doesn't add .00 for whole numbers
// • Returns "–" if blank, otherwise formatted number without unnecessary decimals
#let money_clean(v) = {
  if v == none { "–" } else {
    let n = if type(v) == "str" { num(v) } else { v }
    let r = round(n)
    str(r)
  }
}

// dash(value)
// • Returns "–" for none values, otherwise returns the value as-is
// • Useful for optional fields that should show a dash when empty
#let dash(x) = if x == none { "–" } else { x }
