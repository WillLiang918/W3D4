class Question < ActiveRecord::Base

  validates :text, presence: true
  validates :poll_id, presence: true

  has_many(
    :answer_choices,
    class_name: 'AnswerChoice',
    foreign_key: :question_id,
    primary_key: :id
  )

  belongs_to(
    :poll,
    class_name: 'Poll',
    foreign_key: :poll_id,
    primary_key: :id
  )

  has_many(
    :responses,
    through: :answer_choices,
    source: :responses
  )

#   def results
#   #   answer_choices = self.answer_choices
#   #   result_counts = {}
#   #
#   #   answer_choices.each do |answer_choice|
#   #     result_counts[answer_choice.text] = answer_choice.responses.count
#   #   end
#   #
#   #   result_counts
#     result_counts = {}
#     answer_choices = answer_choices.includes(:responses)
#
#     answer_choices.each do |answer_choice|
#       result_counts[answer_choice.text] = answer_choice.responses.length
#     end
#
#     result_counts
#   end

  def results
    result_hash = {}
    results = answer_choices
    .select("answer_choices.*, COUNT(responses.id) AS response_counts") #answer_choices.text,
    .joins("LEFT OUTER JOIN responses ON responses.answer_choice_id = answer_choices.id")
    .group("answer_choices.id")

    results.each do |result|
      result_hash[result.text] = result.response_counts
    end
    
    result_hash
  end
end

# SELECT
#   answer_choices.*, COUNT(responses.*)
# FROM
#   answer_choices
# LEFT OUTER JOIN
#   responses
# ON
#   responses.answer_choice_id = answer_choices.id
# WHERE
#   answer_choices.question_id = ?
# GROUP BY
#   answer_choices.id
