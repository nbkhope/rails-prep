# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Article.delete_all
Comment.delete_all

# Create fake articles
30.times do
  Article.create(title: Faker::Book.title, text: Faker::Lorem.sentence)
end

# Create fake comments for articles
Article.all.each do |article|
	rand(0..5).times do
		Comment.create(
			commenter: Faker::Internet.name, 
			body: Faker::Lorem.sentence,
			article: article
		)
	end
end