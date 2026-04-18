// template.typ

#import "@preview/fontawesome:0.5.0": fa-icon

// Map from tool name (lowercase) to FontAwesome icon name.
// Extend as needed. Tools not in this table fall back to plain text.
#let _fa-map = (
  "r": "r-project",
  "python": "python",
  "julia": none,        // no FA glyph — text fallback
  "git": "git-alt",
  "github": "github",
  "spss": none,
  "stata": none,
  "zotero": none,
  "email": "envelope",
  "phone": "phone",
  "orcid": "orcid",
  "linkedin": "linkedin",
  "website": "globe",
)

// Returns content: SVG image, FA glyph, or empty (for text-only fallback).
// size: length for the icon box
// tint: color applied to FA icons (SVGs are rendered as-is)
#let _resolve-icon(name, icon-path: none, size: 11pt, tint: rgb("#4a7c8e")) = {
  let key = lower(name)

  // 1. Try custom SVG.
  // NOTE: Typst 0.14 has no try/catch. If icon-path is set, every tool name
  // must have a matching SVG in that directory, or the compile will fail.
  if icon-path != none {
    return image(icon-path + key + ".svg", width: size, height: size)
  }

  // 2. Try FontAwesome
  if key in _fa-map and _fa-map.at(key) != none {
    return text(size: size, fill: tint, fa-icon(_fa-map.at(key)))
  }

  // 3. Empty — caller renders name as plain text
  return none
}

// Sidebar state — skills and languages accumulate here
#let _cv-sidebar = state("_cv-sidebar", ())

// Internal: render accumulated sidebar content (implemented in later tasks)
#let _render-sidebar(items, accent: rgb("#4a7c8e"), icon-path: none) = {
  text(size: 8pt, fill: luma(80))[Sidebar placeholder]
}

// Internal: styled section heading with accent bar and fading wash
#let _section-heading(title, accent) = {
  block(
    width: 100%,
    above: 1.2em,
    below: 0.5em,
    clip: false,
    {
      // Fading background wash
      place(
        top + left,
        dx: 0pt,
        dy: 0pt,
        block(
          width: 100%,
          height: 1.6em,
          fill: gradient.linear(
            (accent.transparentize(80%), 0%),
            (accent.transparentize(100%), 100%),
            dir: ltr,
          ),
        ),
      )
      // Accent bar + label
      stack(
        dir: ltr,
        spacing: 6pt,
        rect(width: 3pt, height: 1.4em, fill: accent, radius: 1pt),
        box(
          inset: (top: 2pt),
          text(
            size: 8.5pt,
            weight: "bold",
            tracking: 1.5pt,
            fill: luma(20),
            smallcaps(title),
          ),
        ),
      )
    },
  )
}

#let cv(
  name: "",
  title: "",
  contact: (:),
  accent: rgb("#4a7c8e"),
  icon-path: none,
  body,
) = {
  // Page
  set page(
    paper: "a4",
    margin: (top: 1.5cm, bottom: 1.5cm, left: 1.5cm, right: 1.5cm),
  )
  set text(font: "Source Sans 3", size: 10pt, fill: luma(20))
  set par(leading: 0.6em)

  // Full-width header
  block(width: 100%, below: 1em)[
    #text(size: 22pt, weight: "bold")[#name] \
    #text(size: 10pt, fill: luma(50))[#title]
  ]

  // Two-column body
  let sidebar-width = 30%
  let gutter = 1em

  grid(
    columns: (1fr, sidebar-width),
    column-gutter: gutter,
    // Main column
    body,
    // Sidebar column — accent rule on left, content bottom-aligned
    block(
      width: 100%,
      height: 100%,
      stroke: (left: 0.5pt + accent),
      inset: (left: 8pt, right: 0pt, top: 0pt, bottom: 0pt),
      align(
        bottom,
        context _render-sidebar(
          _cv-sidebar.final(),
          accent: accent,
          icon-path: icon-path,
        ),
      ),
    ),
  )
}
