class Answer < ApplicationRecord
  belongs_to :user
  belongs_to :question

  validates :content, presence: true, length: { in: 10..200 }
end
