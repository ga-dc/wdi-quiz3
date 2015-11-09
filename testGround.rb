require "pry"

# to clarify beginning of new ruby in the consule
puts "*" * 40

# Question 1
# # define offerRose method, which takes a name and puts a sentence
# def offerRose (person)
#   puts "Would you take this rose and help out an old beggar, #{person}?"
# end
# # call offerRose method
# offerRose("Young Prince")

# Question 2
# town = {
#   residents: ["Maurice", "Belle", "Gaston"],
#   castle: {
#     num_rooms: 47,
#     residents: "Robby Benson",
#     guests: []
#   }
# }
#
# # remove Belle from the town residents
# belle = town[:residents].slice!(town[:residents].index("Belle"))
# # add her to the list of guests in the castle.
# town[:castle][:guests].push(belle)

# Question 3
# declare friends array
friends = ["Chip Potts", "Cogsworth", "Lumière", "Mrs. Potts"]
# Using `.each` AND string interpolation,
# produce output (using `puts`) based on "friends" array:
friends.each do |friend|
  puts "Belle is friends with #{friend}."
end

# Question 4
# no test code needed

# Question 5
# no test code needed

# Question 6


# Question 7


# Question 8



binding.pry
