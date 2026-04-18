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

#research-experience(
  (role: "Research Assistant", institution: "Karolinska Institutet", years: "2020–2021",
   description: "Assisted with data collection for a longitudinal cohort study."),
)

#teaching(
  (role: "Teaching Assistant", course: "Epidemiology I", institution: "KI", years: "2022–"),
)

#conference-presentations(
  (title: "Effect of X on Y", event: "Nordic Public Health Conference", year: "2023", location: "Oslo"),
)

#publications(
  heading: "Journal Articles",
  (authors: "Andersson J, Smith B", year: "2023",
   title: "Effect of X on Y in a large cohort.",
   journal: "J Public Health", doi: "10.1000/xyz"),
  (authors: "Andersson J et al.", year: "2022",
   title: "Prevalence of Z among Swedish adults.",
   journal: "Scand J Public Health"),
)
