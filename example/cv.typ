#import "../template.typ": *

#show: cv.with(
  name: "Solomon Grundy",
  title: "Supervillain and Antihero",
  contact: (
    email: "solomon@grundy.xyz",
    phone: "+01 70 000 0000",
    orcid: "0000-0001-2345-6789",
    website: "www.bornonmonday.xyz",
  ),
  accent: rgb("#4a7c8e"),
  icon-path: none,
)

#education(
  (
    degree: "PhD, Archvillain",
    institution: "Bane Academy",
    years: "2021-",
    description: "Thesis title: How to annoy Batman",
  ),
  (
    degree: "MSc Villainism",
    institution: "Arkham City University",
    description: "Thesis title: Know your poems",
    years: "2019-2021",
  ),
  (
    degree: "BSc Public Nuisance",
    institution: "Arkham City University",
    description: "Thesis title: Born on Monday, died on Tuesday",
    years: "2017-2019",
  ),
)

#research-experience(
  (
    role: "PhD Researcher",
    institution: "Bane Academy",
    years: "2021–",
    description: "Investigating strategies to exploit deontistic vigilante superheroes.",
  ),
  (
    role: "Research Assistant",
    institution: "Arkham City University",
    years: "2019–2021",
    description: "Laboratory management and statistical analysis for a longitudinal cohort study of bats.",
  ),
)

#publications("example/bibliography.bib", style: "apa")

#grants-and-awards(
  (title: "Criminal Prodigy Research Grant", amount: "10,000€", year: "2024", description: "Awarded by Bane Academy."),
  (
    title: "Best Explosive Contraption Award",
    amount: "150€",
    year: "2023",
    description: "Built an explosive batarang in under 30 minutes.",
  ),
)

#teaching(
  (
    course: "Antagonism I",
    institution: "Bane Academy",
    years: "2022–",
    description: "Teaching this course every year to Bachelor students.",
  ),
  (
    course: "Explosive contraptions for dummies",
    institution: "Gotham Institute",
    years: "2023",
    description: "Taught this course as a guest lecturer.",
  ),
)

#conference-presentations(
  (
    title: "Neighbourhood deprivation drives villainry: new evidence from Gotham City",
    event: "International Conference of Villains",
    year: "2023",
    location: "Gotham City",
  ),
  (
    title: "Tricking superheroes: what you need to know",
    event: "Congress of Deception",
    year: "2022",
    location: "Arkham City",
  ),
)

#references(
  (
    name: "Joker",
    institution: "None of your business",
    email: "iwillfindyou@first.com",
  ),
)
