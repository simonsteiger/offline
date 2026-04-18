#import "../template.typ": *

#show: cv.with(
  name: "Jane Andersson",
  title: "PhD Candidate in Public Health",
  contact: (
    email: "jane@ki.se",
    phone: "+46 70 000 0000",
    orcid: "0000-0001-2345-6789",
    website: "janeandersson.se",
  ),
  accent: rgb("#4a7c8e"),
  icon-path: none,
)

#education(
  (degree: "PhD, Public Health", institution: "Karolinska Institutet", years: "2021–"),
  (degree: "MSc Epidemiology", institution: "Stockholm University", years: "2019"),
  (degree: "BSc Biology", institution: "Uppsala University", years: "2017"),
)

#research-experience(
  (role: "PhD Researcher", institution: "Karolinska Institutet",
   years: "2021–", description: "Investigating social determinants of cardiovascular disease in Swedish registry data."),
  (role: "Research Assistant", institution: "Karolinska Institutet",
   years: "2019–2021", description: "Data management and statistical analysis for a longitudinal cohort study."),
)

#publications(
  heading: "Journal Articles",
  (authors: "Andersson J, Smith B, Lindqvist M", year: "2023",
   title: "Neighbourhood deprivation and cardiovascular outcomes: a registry-based cohort study.",
   journal: "J Epidemiol Community Health", doi: "10.1136/jech-2023-000001"),
  (authors: "Andersson J, Lindqvist M", year: "2022",
   title: "Trends in hypertension prevalence among Swedish adults, 2000–2020.",
   journal: "Scand J Public Health"),
)

#grants-and-awards(
  (title: "KI Doctoral Research Grant", funder: "Karolinska Institutet", year: "2022"),
  (title: "Best Poster Award", funder: "Nordic Public Health Conference", year: "2023"),
)

#teaching(
  (role: "Teaching Assistant", course: "Epidemiology I",
   institution: "Karolinska Institutet", years: "2022–2023"),
  (role: "Guest Lecturer", course: "Social Determinants of Health",
   institution: "Stockholm University", years: "2023"),
)

#conference-presentations(
  (title: "Neighbourhood deprivation and CVD: new evidence from Swedish registers",
   event: "Nordic Public Health Conference", year: "2023", location: "Oslo"),
  (title: "Hypertension trends in Sweden",
   event: "European Congress of Epidemiology", year: "2022", location: "Utrecht"),
)

#references(note: "Available on request")

#skills(
  (category: "Statistical",  tools: ("R", "SPSS", "Stata")),
  (category: "Programming",  tools: ("Python", "Julia")),
  (category: "Software",     tools: ("Zotero", "Git")),
)

#languages(
  (language: "Swedish", level: "Native"),
  (language: "English", level: "Fluent"),
  (language: "German",  level: "Basic"),
)
