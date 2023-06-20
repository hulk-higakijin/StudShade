class Question < ApplicationRecord
  belongs_to :user

  validates :title, presence: true, length: { in: 5..30 }
  validates :content, presence: true, length: { in: 10..1000 }
end
