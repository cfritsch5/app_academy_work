# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
Poll.destroy_all
Question.destroy_all
AnswerChoice.destroy_all
Response.destroy_all


user1 = User.create(user_name: "Casey")
user2 = User.create(user_name: "Chris")
user3 = User.create(user_name: "Justin")
user4 = User.create(user_name: "Joey")

poll1 = Poll.create(author_id: user1.id, title: "What are you thinking about?")
poll2 = Poll.create(author_id: user2.id, title: "Answer Me!")
poll3 = Poll.create(author_id: user3.id, title: "What are your favorite cats?")

question1 = Question.create(questions: "Really.. What are you thinking about?", poll_id: poll1.id)
question2 = Question.create(questions: "What is your favorite color?", poll_id: poll2.id)
question3 = Question.create(questions: "Do you like gray cats?", poll_id: poll3.id)
question4 = Question.create(questions: "Who is your favorite internet cat?", poll_id: poll3.id)

answer1 = AnswerChoice.create(answer_choice: "Sleep", question_id: question1.id)
answer2 = AnswerChoice.create(answer_choice: "Food", question_id: question1.id)

answer3 = AnswerChoice.create(answer_choice: "Blue", question_id: question2.id)
answer4 = AnswerChoice.create(answer_choice: "Yellow", question_id: question2.id)
answer5 = AnswerChoice.create(answer_choice: "Cyan", question_id: question2.id)

answer6 = AnswerChoice.create(answer_choice: "Yes", question_id: question3.id)
answer7 = AnswerChoice.create(answer_choice: "No", question_id: question3.id)

answer8 = AnswerChoice.create(answer_choice: "I hate cats", question_id: question4.id)
answer9 = AnswerChoice.create(answer_choice: "Grumpy Cat", question_id: question4.id)
answer10 = AnswerChoice.create(answer_choice: "Nyan Cat", question_id: question4.id)
answer11 = AnswerChoice.create(answer_choice: "Colonel Meow", question_id: question4.id)
answer12 = AnswerChoice.create(answer_choice: "Maru", question_id: question4.id)
answer13 = AnswerChoice.create(answer_choice: "Lil Bub", question_id: question4.id)

response1 = Response.create(user_id: user1.id, answer_choice_id: answer1.id)
response2 = Response.create(user_id: user1.id, answer_choice_id: answer3.id)
response3 = Response.create(user_id: user2.id, answer_choice_id: answer2.id)
response4 = Response.create(user_id: user2.id, answer_choice_id: answer4.id)
response5 = Response.create(user_id: user2.id, answer_choice_id: answer7.id)
response6 = Response.create(user_id: user2.id, answer_choice_id: answer11.id)
response7 = Response.create(user_id: user3.id, answer_choice_id: answer6.id)
response8 = Response.create(user_id: user3.id, answer_choice_id: answer13.id)
response9 = Response.create(user_id: user4.id, answer_choice_id: answer5.id)
