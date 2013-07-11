# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Topic.create(user_id: 1, content: "11as dfasdf as dfasdf asdf as dfa sdfas df as df asd f asd fa sdf", username: "charles", count: 1)
Topic.create(user_id: 1, content: "22as dfasdf as dfasdf asdf as dfa sdfas df as df asd f asd fa sdf", username: "charles", count: 2)
Topic.create(user_id: 1, content: "33as dfasdf as dfasdf asdf as dfa sdfas df as df asd f asd fa sdf", username: "charles", count: 3)
Topic.create(user_id: 1, content: "44as dfasdf as dfasdf asdf as dfa sdfas df as df asd f asd fa sdf", username: "charles", count: 4)
Topic.create(user_id: 1, content: "55as dfasdf as dfasdf asdf as dfa sdfas df as df asd f asd fa sdf", username: "charles", count: 5)
Topic.create(user_id: 1, content: "66as dfasdf as dfasdf asdf as dfa sdfas df as df asd f asd fa sdf", username: "charles", count: 6)

Essay.create(user_id: 2, topic_id: 1, username: "charles", content: "1afd sfa sdf a sdfasd fasdf")
Essay.create(user_id: 2, topic_id: 2, username: "charles", content: "2afd sfa sdf a sdfasd fasdf")
Essay.create(user_id: 2, topic_id: 3, username: "charles", content: "3afd sfa sdf a sdfasd fasdf")
Essay.create(user_id: 2, topic_id: 4, username: "charles", content: "4afd sfa sdf a sdfasd fasdf")
Essay.create(user_id: 2, topic_id: 5, username: "charles", content: "5afd sfa sdf a sdfasd fasdf")
Essay.create(user_id: 2, topic_id: 6, username: "charles", content: "6afd sfa sdf a sdfasd fasdf")
