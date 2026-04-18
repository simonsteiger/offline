// template.typ

#import "@preview/fontawesome:0.5.0": fa-icon

// Map from tool name (lowercase) to FontAwesome icon name.
// Extend as needed. Tools not in this table fall back to plain text.
#let _fa-map = (
  "r": "r-project",
  "python": "python",
  "julia": none, // no FA glyph — text fallback
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

// Render this in the top right corner as a little box?
#let _contact-line(contact, accent, icon-path) = {
  let items = ()
  let keys = ("email", "phone", "orcid", "linkedin", "website")

  let y = 0
  for key in keys {
    if key in contact and contact.at(key) != none {
      let value = contact.at(key)
      items.push(grid.cell(x: 1, y: y, text(size: 9pt, value)))
      y += 1
    }
  }

  items
}

// Accent color state — set by cv(), read by block functions
#let _cv-accent = state("_cv-accent", rgb("#4a7c8e"))

// Internal: styled section heading with accent bar and fading wash
#let _section-heading(title, accent) = {
  block(
    width: 100%,
    above: 2em,
    below: 1em,
    clip: false,
    {
      set align(horizon)
      // Fading background wash
      block(
        width: 100%,
        height: 2em,
        inset: (left: 10pt),
        radius: 2pt,
        fill: gradient.linear(
          (accent.transparentize(20%), 0%),
          (accent.transparentize(80%), 1%),
          (accent.transparentize(100%), 80%),
          (accent.transparentize(100%), 100%),
          dir: ltr,
        ),
        text(
          weight: "bold",
          fill: luma(20),
          title,
        ),
      )
    },
  )
}

#let education(..entries) = {
  context _section-heading("Education", _cv-accent.get())
  for entry in entries.pos() {
    block(inset: (left: 1em, y: 0.25em), {
      grid(
        columns: (50%, 35%, 15%),
        rows: 2,
        column-gutter: 1em,
        row-gutter: 0.75em,
        grid.cell(x: 0, y: 0, strong(entry.degree)),
        grid.cell(x: 1, y: 0, text(size: 9pt, entry.institution)),
        grid.cell(x: 2, y: 0, text(size: 9pt, entry.years)),
        grid.cell(x: 0, y: 1, if "description" in entry and entry.description != none {
          text(size: 9pt, entry.description)
        }),
      )
    })
  }
}

#let research-experience(..entries) = {
  context _section-heading("Research Experience", _cv-accent.get())
  for entry in entries.pos() {
    block(inset: (left: 1em, y: 0.25em), {
      grid(
        columns: (50%, 35%, 15%),
        rows: 2,
        column-gutter: 1em,
        row-gutter: 0.75em,
        grid.cell(x: 0, y: 0, strong(entry.role)),
        grid.cell(x: 1, y: 0, text(size: 9pt, entry.institution)),
        grid.cell(x: 2, y: 0, text(size: 9pt, entry.years)),
        grid.cell(x: 0, y: 1, if "description" in entry and entry.description != none {
          text(size: 9pt, entry.description)
        }),
      )
    })
  }
}

#let teaching(..entries) = {
  context _section-heading("Teaching", _cv-accent.get())
  for entry in entries.pos() {
    block(inset: (left: 1em, y: 0.25em), {
      grid(
        columns: (50%, 35%, 15%),
        rows: 2,
        column-gutter: 1em,
        row-gutter: 0.75em,
        grid.cell(x: 0, y: 0, strong(entry.course)),
        grid.cell(x: 1, y: 0, text(size: 9pt, entry.institution)),
        grid.cell(x: 2, y: 0, text(size: 9pt, entry.years)),
        grid.cell(x: 0, y: 1, if "description" in entry and entry.description != none {
          text(size: 9pt, entry.description)
        }),
      )
    })
  }
}

#let conference-presentations(..entries) = {
  context _section-heading("Conference Presentations", _cv-accent.get())
  for entry in entries.pos() {
    block(inset: (left: 1em, y: 0.25em), {
      grid(
        columns: (50%, 35%, 15%),
        rows: 2,
        column-gutter: 1em,
        row-gutter: 0.75em,
        grid.cell(x: 0, y: 0, colspan: 2, strong(entry.title)),
        grid.cell(x: 2, y: 0, text(size: 9pt, entry.year)),
        grid.cell(x: 0, y: 1, text(size: 9pt, entry.event + ", " + entry.location)),
      )
    })
  }
}

#let publications(bib-path, ..args) = {
  context _section-heading("Publications", _cv-accent.get())
  set text(size: 9pt)
  block(inset: (left: 1em, y: 0.25em), bibliography(bib-path, full: true, title: none, ..args))
}

#let grants-and-awards(..entries) = {
  context _section-heading("Grants & Awards", _cv-accent.get())
  for entry in entries.pos() {
    block(inset: (left: 1em, y: 0.25em), {
      grid(
        columns: (50%, 35%, 15%),
        rows: 2,
        column-gutter: 1em,
        row-gutter: 0.75em,
        grid.cell(x: 0, y: 0, strong(entry.title)),
        grid.cell(x: 1, y: 0, text(size: 9pt, entry.amount)),
        grid.cell(x: 2, y: 0, text(size: 9pt, entry.year)),
        grid.cell(x: 0, y: 1, if "description" in entry and entry.description != none {
          text(size: 9pt, entry.description)
        }),
      )
    })
  }
}

#let references(..entries) = {
  context _section-heading("References", _cv-accent.get())
  for entry in entries.pos() {
    block(inset: (left: 1em, y: 0.25em), {
      grid(
        columns: (50%, 35%, 15%),
        rows: 2,
        column-gutter: 1em,
        row-gutter: 0.75em,
        grid.cell(x: 0, y: 0, strong(entry.name)),
        grid.cell(x: 1, y: 0, text(size: 9pt, entry.institution)),
        grid.cell(x: 0, y: 1, text(size: 9pt, entry.email)),
      )
    })
  }
}

#let cv(
  name: "",
  title: "",
  contact: (:),
  accent: rgb("#4a7c8e"),
  icon-path: none,
  body,
) = {
  _cv-accent.update(_ => accent)

  show bibliography.where(full: true): it => {
    let last-name = name.split().last()
    show last-name: strong(last-name)
    it
  }

  // Page
  set page(
    paper: "a4",
    margin: 1.5cm,
  )
  set text(font: "Helvetica Neue", size: 10pt, fill: luma(20), tracking: 0.3pt)
  set par(leading: 0.6em)

  grid(
    columns: (1fr, auto),
    rows: contact.len(),
    row-gutter: 0.75em,
    grid.cell(x: 0, y: 0, rowspan: contact.len(), align(horizon, stack(
      dir: ttb,
      spacing: 12pt,
      text(size: 20pt, weight: "bold", name),
      text(size: 16pt, title),
    ))),
    .._contact-line(contact, accent, icon-path),
  )

  body
}
