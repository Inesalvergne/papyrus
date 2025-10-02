# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# db/seeds.rb

puts "Cleaning database..."
Authorship.destroy_all
Book.destroy_all
Author.destroy_all

puts "Creating authors..."

authors = {
  "Frank Herbert" => Author.create!(
    first_name: "Frank",
    last_name: "Herbert",
    birth_year: 1920,
    death_year: 1986,
    birth_country: "USA",
    bio: "American science-fiction author best known for the Dune saga."
  ),
  "Alain Damasio" => Author.create!(
    first_name: "Alain",
    last_name: "Damasio",
    birth_year: 1969,
    death_year: nil,
    birth_country: "France",
    bio: "French science fiction and fantasy writer."
  ),
  "Isaac Asimov" => Author.create!(
    first_name: "Isaac",
    last_name: "Asimov",
    birth_year: 1920,
    death_year: 1992,
    birth_country: "Russia/USA",
    bio: "Prolific author and professor of biochemistry, best known for his works of science fiction."
  ),
  "Victor Hugo" => Author.create!(
    first_name: "Victor",
    last_name: "Hugo",
    birth_year: 1802,
    death_year: 1885,
    birth_country: "France",
    bio: "French poet, novelist, and dramatist of the Romantic movement."
  ),
  "Jack Kerouac" => Author.create!(
    first_name: "Jack",
    last_name: "Kerouac",
    birth_year: 1922,
    death_year: 1969,
    birth_country: "USA",
    bio: "American novelist and poet of French-Canadian descent, pioneer of the Beat Generation."
  ),
  "George Orwell" => Author.create!(
    first_name: "George",
    last_name: "Orwell",
    birth_year: 1903,
    death_year: 1950,
    birth_country: "India/UK",
    bio: "English novelist, essayist, journalist, and critic."
  ),
  "Franz Kafka" => Author.create!(
    first_name: "Franz",
    last_name: "Kafka",
    birth_year: 1883,
    death_year: 1924,
    birth_country: "Austria-Hungary (Czech Republic)",
    bio: "German-speaking Bohemian novelist and short-story writer."
  )
}

puts "Creating books..."

books = {
  "Dune" => Book.create!(
    title: "Dune",
    first_publish_year: 1965,
    summary: "Epic science fiction novel about politics, religion, and ecology on the desert planet Arrakis.",
    pages: 412,
    language: "English"
  ),
  "La Horde du Contrevent" => Book.create!(
    title: "La Horde du Contrevent",
    first_publish_year: 2004,
    summary: "French science fiction novel following a band of wind-walkers in a quest against the wind.",
    pages: 700,
    language: "French"
  ),
  "Les Furtifs" => Book.create!(
    title: "Les Furtifs",
    first_publish_year: 2019,
    summary: "A speculative fiction novel about elusive creatures symbolizing resistance and freedom.",
    pages: 600,
    language: "French"
  ),
  "Foundation" => Book.create!(
    title: "Foundation",
    first_publish_year: 1951,
    summary: "Science fiction classic about the fall of the Galactic Empire and the rise of the Foundation.",
    pages: 255,
    language: "English"
  ),
  "Les Misérables" => Book.create!(
    title: "Les Misérables",
    first_publish_year: 1862,
    summary: "A monumental French novel about justice, redemption, and revolution.",
    pages: 1463,
    language: "French"
  ),
  "Notre-Dame de Paris" => Book.create!(
    title: "Notre-Dame de Paris",
    first_publish_year: 1831,
    summary: "Historical novel set in 15th century Paris, centered around the cathedral and its characters.",
    pages: 940,
    language: "French"
  ),
  "On the Road" => Book.create!(
    title: "On the Road",
    first_publish_year: 1957,
    summary: "Beat Generation novel about cross-country travels and the search for meaning.",
    pages: 320,
    language: "English"
  ),
  "1984" => Book.create!(
    title: "1984",
    first_publish_year: 1949,
    summary: "Dystopian novel depicting a totalitarian regime and the suppression of truth.",
    pages: 328,
    language: "English"
  ),
  "Le Procès" => Book.create!(
    title: "Le Procès",
    first_publish_year: 1925,
    summary: "Kafka's existential novel about Joseph K. facing a mysterious and oppressive legal system.",
    pages: 256,
    language: "German"
  )
}

puts "Creating authorships..."

Authorship.create!(book: books["Dune"], author: authors["Frank Herbert"])
Authorship.create!(book: books["La Horde du Contrevent"], author: authors["Alain Damasio"])
Authorship.create!(book: books["Les Furtifs"], author: authors["Alain Damasio"])
Authorship.create!(book: books["Foundation"], author: authors["Isaac Asimov"])
Authorship.create!(book: books["Les Misérables"], author: authors["Victor Hugo"])
Authorship.create!(book: books["Notre-Dame de Paris"], author: authors["Victor Hugo"])
Authorship.create!(book: books["On the Road"], author: authors["Jack Kerouac"])
Authorship.create!(book: books["1984"], author: authors["George Orwell"])
Authorship.create!(book: books["Le Procès"], author: authors["Franz Kafka"])

puts "Seeding done! ✅"
