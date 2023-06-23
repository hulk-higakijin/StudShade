class Answer < ApplicationRecord
  belongs_to :user
  belongs_to :question

  validates :content, presence: true, length: { in: 10..200 }
  validates :user_id, uniqueness: { scope: :question_id, message: 'は同じ質問に対して一回しか回答できません' }
end
