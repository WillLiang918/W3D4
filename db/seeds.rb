# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

ActiveRecord::Base.transaction do

  User.delete_all
  Poll.delete_all
  Question.delete_all
  AnswerChoice.delete_all
  Response.delete_all


  # 5.times do |i|
  #
  #   User.create!(
  #     user_name:  "name" + i.to_s
  #   )
  #
  # end
  #
  # 2.times do |i|
  #
  #   Poll.create!(
  #     title: "title" + i.to_s,
  #     author_id: User.all[i].id
  #   )
  #
  # end
  #
  # 3.times do |i|
  #
  #   Question.create!(
  #     text: "texttexttexttext" + i.to_s,
  #     poll_id: Poll.all[rand(2)].id
  #   )
  #
  # end
  #
  # 3.times do |i|
  #
  #   AnswerChoice.create!(
  #     text: "answeransweranswer" + i.to_s,
  #     question_id: Question.all[rand(3)].id
  #   )
  #
  # end
  #
  # 20.times do |i|
  #
  #   Response.create!(
  #     answer_choice_id: AnswerChoice.all[rand(3)].id,
  #     user_id: User.all[rand(5)].id
  #   )
  #
  # end

  user0 = User.create!(
    user_name: "App Academy0"
  )
  user1 = User.create!(
    user_name: "App Academy1"
  )
  user2 = User.create!(
    user_name: "App Academy2"
  )
  user3 = User.create!(
    user_name: "App Academy3"
  )

  poll = Poll.create!(
    author_id: user0.id,
    title: "Hi"
  )

  poll2 = Poll.create!(
    author_id: user1.id,
    title: "hfes"
  )

  question = Question.create!(
    text: "HELLLLOOO",
    poll_id: poll.id
  )

  answer_c = AnswerChoice.create!(
    text: "AABBBCC",
    question_id: question.id
  )

  answer_c2 = AnswerChoice.create!(
    text: "CCCBBBAAA",
    question_id: question.id
  )


  response0 = Response.create!(
    answer_choice_id: answer_c.id,
    user_id: user1.id
  )

  response1 = Response.create!(
    answer_choice_id: answer_c.id,
    user_id: user2.id
  )

  response3 = Response.create!(
    answer_choice_id: answer_c2.id,
    user_id: user3.id
  )
  answer_c3 = AnswerChoice.create!(
    text: "Helloo",
    question_id: question.id

  )

end
