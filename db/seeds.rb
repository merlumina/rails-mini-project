# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Type.create(name: "Fish", slug: "fish")
Type.create(name: "Bugs", slug: "bugs")
Type.create(name: "Sea Creatures", slug: "sea")

Type.all.each do |type|
    critter_results = Api.get_critters(type.slug)
    critter_results.each do |result|
        Critter.create_from_result(result, type.id)
    end
end