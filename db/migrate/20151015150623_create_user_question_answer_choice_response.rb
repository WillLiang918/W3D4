class CreateUserQuestionAnswerChoiceResponse < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :user_name

      t.timestamps
    end

    create_table :polls do |t|
      t.string   :title
      t.integer  :author_id

      t.timestamps
    end

    add_index :polls, :author_id

    create_table :questions do |t|
      t.string   :text
      t.integer  :poll_id

      t.timestamps
    end

    add_index :questions, :poll_id

    create_table :answer_choices do |t|
      t.string   :text
      t.integer  :question_id

      t.timestamps
    end

    add_index :answer_choices, :question_id

    create_table :responses do |t|
      t.integer  :answer_choice_id
      t.integer  :user_id

      t.timestamps
    end

    add_index :responses, :answer_choice_id
    add_index :responses, :user_id
  end
end
