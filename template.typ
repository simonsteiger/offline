#let _contact-line(contact, accent, icon-path) = {
  let items = ()
  let keys = ("email", "phone", "orcid", "linkedin", "website")

  let y = 0
  for key in keys {
    if key in contact and contact.at(key) != none {
      let value = contact.at(key)
      let icon = image(icon-path + key + ".svg", height: 1.25em) // TODO must check if path exists!
      items.push(stack(dir: ltr, spacing: 0.3em, align(horizon + right, text(size: 9pt, value)), icon))
      y += 1
    }
  }

  stack(dir: ttb, spacing: 0.25em, ..items)
}

#let build-entries-cells(..entries, rows-per-entry: 3) = {
  let items = ()
  let y = 1

  for entry in entries.pos() {
    let has-description = "description" in entry and entry.description != none
    let has-institution = "institution" in entry and entry.institution != none

    let title-text = strong(entry.name) + if has-institution { text(9pt, " | " + entry.institution) }
    let date-text = align(right, text(9pt, entry.date))
    let description-text = if has-description { text(9pt, entry.description) } else { none }

    items.push(grid.cell(x: 1, y: (y - 1) * rows-per-entry, align(bottom, title-text)))
    items.push(grid.cell(x: 2, y: (y - 1) * rows-per-entry, date-text))
    items.push(grid.cell(x: 1, y: 1 + (y - 1) * rows-per-entry, description-text))

    y += 1
  }

  items
}

#let entries-block(..entries, title: none, rows-per-entry: 3) = {
  block(inset: (y: 0.25em), {
    grid(
      columns: (11em, 1fr, 5em),
      rows: (rows-per-entry * entries.pos().len()) - 1,
      column-gutter: 1em,
      row-gutter: 0.75em,
      grid.cell(x: 0, y: 0, text(size: 18pt, font: "Cronos Pro", smallcaps(title))),
      ..build-entries-cells(..entries, rows-per-entry: rows-per-entry),
    )
  })
}

#let section(title, ..entries) = {
  let rows-per-entry = 3
  entries-block(..entries, title: title)
}

#let publications(bib-path, ..args) = {
  block(inset: (y: 0.25em), grid(
    columns: (11em, 1fr, 5em),
    column-gutter: 1em,
    text(size: 18pt, font: "Cronos Pro", smallcaps("Publications")),
    bibliography(bib-path, full: true, title: none, ..args),
  ))
}

#let grants-and-awards(..entries) = {
  for entry in entries.pos() {
    block(inset: (left: 1em, y: 0.25em), {
      grid(
        columns: (60%, 15%, 25%),
        rows: 2,
        column-gutter: 1em,
        row-gutter: 0.75em,
        grid.cell(x: 0, y: 0, strong(entry.title)),
        grid.cell(x: 1, y: 0, text(size: 9pt, entry.amount)),
        grid.cell(x: 2, y: 0, text(size: 9pt, entry.date)),
        grid.cell(x: 0, y: 1, if "description" in entry and entry.description != none {
          text(size: 9pt, entry.description)
        }),
      )
    })
  }
}

#let references(..entries) = {
  for entry in entries.pos() {
    block(inset: (left: 1em, y: 0.25em), {
      grid(
        columns: 1,
        rows: 3,
        column-gutter: 1em,
        row-gutter: 0.75em,
        grid.cell(x: 0, y: 0, strong(entry.name) + ", " + entry.title),
        grid.cell(x: 0, y: 1, text(size: 9pt, entry.institution)),
        grid.cell(x: 0, y: 2, text(size: 9pt, entry.email)),
      )
    })
  }
}

#let cv(
  name: "",
  contact: (:),
  accent: rgb("#4a7c8e"),
  icon-path: none,
  body,
) = {
  show bibliography.where(full: true): it => {
    let last-name = name.split().last()
    show last-name: strong(last-name)
    it
  }

  // Page
  set page(paper: "a4", margin: 1.5cm)
  set text(font: "Helvetica Neue", size: 10pt, fill: luma(20), tracking: 0.15pt)
  set par(leading: 0.6em)


  grid(
    columns: (3fr, 1fr),
    rows: contact.len(),
    column-gutter: 1.5em,
    // the pad call is really unelegant and makes me unhappy :c
    grid.cell(x: 0, y: 0, rowspan: contact.len(), align(bottom, pad(bottom: 0.3em, text(
      size: 28pt,
      font: "Calluna",
      smallcaps(name),
    )))),
    grid.cell(x: 1, y: 0, rowspan: contact.len(), _contact-line(contact, accent, icon-path)),
  )

  line(length: 100%, stroke: 0.5pt)

  body
}
