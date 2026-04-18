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

#education(
  (degree: "PhD, Public Health", institution: "Karolinska Institutet", years: "2021–"),
  (degree: "MSc Epidemiology", institution: "Stockholm University", years: "2019"),
)
