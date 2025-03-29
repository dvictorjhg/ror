# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
article1 = Article.create(title: 'First Article', text: 'This is the body of the first article.')
article2 = Article.create(title: 'Second Article', text: 'This is the body of the second article.')

article1.comments.create(commenter: 'Alice', body: 'Great article!')
article1.comments.create(commenter: 'Bob', body: 'Thanks for sharing.')

article2.comments.create(commenter: 'Charlie', body: 'Interesting read.')
