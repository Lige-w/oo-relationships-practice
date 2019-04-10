
require 'bundler/setup'
Bundler.require
require_all 'app'

# create new instances of user
lige = User.new("Lige")
melayna = User.new("Melayna")
suki = User.new ("Suki")

# create projects
cool_phone = lige.create_new_project("Cool Phone", 340)
crowdfunding_app = lige.create_new_project("Crowdfunding App", 2000)
dissertation = melayna.create_new_project("Dissertation", 4000)
dog_collar = melayna.create_new_project("Dog Collar", 500)

# Pledge to projects
pledge_1 = melayna.pledge("Crowdfunding App", 20)
pledge_2 = lige.pledge("Dissertation", 10)
pledge_3 = melayna.pledge("Cool Phone", 30)
pledge_4 = suki.pledge("Cool Phone", 340)
pledge_5 = melayna.pledge("Cool Phone", 30)

puts "## test .highest_pledge"
puts User.highest_pledge == suki
puts "---"
puts "## test .multi pledger"
puts User.multi_pledger == [melayna]
puts "---"
puts "## test .project_creator"
puts User.project_creator == [lige, melayna]
puts "---"
puts "## test .no_pledges"
puts Project.no_pledges == [dog_collar]
puts "---"
puts "## test .above_goal"
puts Project.above_goal == [cool_phone]
puts "---"
puts "## test .most_backers"
puts Project.most_backers == cool_phone
puts "---"
puts "## test Pledge#user"
puts pledge_2.user == lige
puts "---"
puts "test Pledge#project"
puts pledge_3.project == cool_phone