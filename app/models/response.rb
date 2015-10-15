class Response < ActiveRecord::Base
  validate  :respondent_has_not_already_answered_question
  validate  :author_can_not_respond_to_own_poll
  validates :answer_choice_id, presence: true
  validates :user_id, presence: true

  belongs_to(
    :answer_choice,
    class_name: 'AnswerChoice',
    foreign_key: :answer_choice_id,
    primary_key: :id
  )

  belongs_to(
    :respondent,
    class_name: 'User',
    foreign_key: :user_id,
    primary_key: :id
  )

  has_one(
    :question,
    through: :answer_choice,
    source: :question
  )



  def sibling_responses
      question.responses.where(":id IS NULL OR responses.id <> :id", id: id)
  end


  # private
  def respondent_has_not_already_answered_question

    if sibling_responses
        .where(":user_id = responses.user_id", user_id: user_id)
        .exists?

      errors[:base] << "The respondent has not answered the question."
    end
  end

  def author_can_not_respond_to_own_poll
        poll_author_id = answer_choice.question.poll.author_id

    if  poll_author_id == user_id
      errors[:base] << "You cannot respond to your own poll."
    end
  end
end
