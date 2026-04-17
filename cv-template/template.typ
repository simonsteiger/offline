// template.typ

// Sidebar state — skills and languages accumulate here
#let _cv-sidebar = state("_cv-sidebar", ())

// Internal: render accumulated sidebar content (implemented in later tasks)
#let _render-sidebar(items, accent: rgb("#4a7c8e"), icon-path: none) = {
  text(size: 8pt, fill: luma(80))[Sidebar placeholder]
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
