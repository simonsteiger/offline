#import "../template.typ": *

#show: cv.with(
  name: "Jane Andersson",
  title: "PhD Candidate in Public Health",
  contact: (
    email: "jane@ki.se",
    phone: "+46 70 000 0000",
    orcid: "0000-0000-0000-0000",
    website: "jane.example.com",
  ),
)

#_section-heading("Education", rgb("#4a7c8e"))

Some content here.

#_section-heading("Publications", rgb("#4a7c8e"))

More content.
