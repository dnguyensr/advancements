# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

scout = User.create(email: "boy@scout.com", password: "password", first_name: "Bob", last_name: "Billy")


advancement = Advancement.create(user_id: scout.id)
scoutrank = Rank.create(rank: "Scout", advancement_id: scout.advancement.id)
tenderfoot = Rank.create(rank: "Tenderfoot", advancement_id: scout.advancement.id)
secondclass = Rank.create(rank: "Second Class", advancement_id: scout.advancement.id)
firstclass = Rank.create(rank: "First Class", advancement_id: scout.advancement.id)
life = Rank.create(rank: "Star", advancement_id: scout.advancement.id)
star = Rank.create(rank: "Life", advancement_id: scout.advancement.id)
eagle = Rank.create(rank: "Eagle", advancement_id: scout.advancement.id)

req1 = Requirement.create(number: 1, rank_id: scoutrank.id, description: "Complete all subrequirements")
Subrequirement.create(requirement_id: req1.id, part:"a", description: "Repeat from memory the Scout Oath, Scout Law, Scout motto, and Scout slogan. In your own words, explain their meaning.")
Subrequirement.create(requirement_id: req1.id, part:"b", description: "Explain what Scout spirit is. Describe some ways you have shown Scout spirit by practicing the Scout Oath, Scout Law, Scout motto, and Scout slogan.")
Subrequirement.create(requirement_id: req1.id, part:"c", description: "Demonstrate the Boy Scout sign, salute, and handshake. Explain when they should be used.")
Subrequirement.create(requirement_id: req1.id, part:"d", description: "Describe the First Class Scout badge and tell what each part stands for. Explain the significance of the First Class Scout badge.")
Subrequirement.create(requirement_id: req1.id, part:"e", description: "Repeat from memory the Outdoor Code. In your own words, explain what the Outdoor Code means to you.")
Subrequirement.create(requirement_id: req1.id, part:"f", description: "Repeat from memory the Pledge of Allegiance. In your own words, explain its meaning.")
req2 = Requirement.create(number: 2, rank_id: scoutrank.id, description: "After attending at least one Boy Scout troop meeting, do the following:")
Subrequirement.create(requirement_id: req2.id, part:"a", description: "Describe how the Scouts in the troop provide its leadership.")
Subrequirement.create(requirement_id: req2.id, part:"b", description: "Describe the four steps of Boy Scout advancement.")
Subrequirement.create(requirement_id: req2.id, part:"c", description: "Describe what the Boy Scout ranks are and how they are earned.")
Subrequirement.create(requirement_id: req2.id, part:"d", description: "Describe what merit badges are and how they are earned.")
req3 = Requirement.create(number: 3, rank_id: scoutrank.id, description: "Complete all subrequirements")
Subrequirement.create(requirement_id: req3.id, part:"a", description: "Explain the patrol method. Describe the types of patrols that are used in your troop.")
Subrequirement.create(requirement_id: req3.id, part:"b", description: "Become familiar with your patrol name, emblem, flag, and yell. Explain how these items create patrol spirit.")
req4 = Requirement.create(number: 4, rank_id: scoutrank.id, description: "Complete all subrequirements")
Subrequirement.create(requirement_id: req4.id, part:"a", description: "Show how to tie a square knot, two half-hitches, and a taut-line hitch. Explain how each knot is used.")
Subrequirement.create(requirement_id: req4.id, part:"b", description: "Show the proper care of a rope by learning how to whip and fuse the ends of different kinds of rope.")
req5 = Requirement.create(number: 5, rank_id: scoutrank.id, description: "Demonstrate your knowledge of pocketknife safety.")
req6 = Requirement.create(number: 6, rank_id: scoutrank.id, description: "With your parent or guardian, complete the exercises in the pamphlet How to Protect Your Children From Child Abuse: A Parent’s Guide and earn the Cyber Chip Award for your grade.")
req7 = Requirement.create(number: 7, rank_id: scoutrank.id, description: "Since joining the troop and while working on the Scout rank, participate in a Scoutmaster conference.")
