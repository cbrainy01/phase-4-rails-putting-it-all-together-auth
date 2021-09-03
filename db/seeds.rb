# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(username: "Mike", password: "apple", password_confirmation: "apple", image_url: "lkjlkjlkj.jpg", bio: "A dude")
User.create(username: "Kim", password: "orange", password_confirmation: "orange", image_url: "mysdpojff.jpg", bio: "Some gyal")

Recipe.create(title: "lamb", instructions: "pour lamb sauce over lamb sssssssssssssssssssssssssssssssssssssssssssssssssssssssssssqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq", minutes_to_complete: 55)
Recipe.create(title: "smoothie", instructions: "blend stuff llllllllllllllllllllllllllllllllllllllllllllllllllweeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeel", minutes_to_complete: 30)