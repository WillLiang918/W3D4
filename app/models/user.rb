class User < ActiveRecord::Base

  validates :user_name, presence: true

  has_many(
    :authored_polls,
    class_name:  "Poll",
    foreign_key: :author_id,
    primary_key: :id
  )

  has_many(
    :responses,
    class_name: "Response",
    foreign_key: :user_id,
    primary_key: :id
  )

  def completed_polls
  end

end




(<--SQL)

SELECT
  polls.*, COUNT(questions.id)
FROM
  polls
JOIN
  questions
ON
  questions.poll_id = polls.id
LEFT OUTER JOIN
  responses
ON
  questions.id IN (
    SELECT
      answer_choices.question_id
    FROM
      responses
    JOIN
      answer_choices
    ON
      answer_choices.id = responses.answer_choice_id

    WHERE
      responses.answer_choice_id = ?
  )
GROUP BY
  polls.id
SQL
