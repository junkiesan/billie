class Book < ApplicationRecord

  # validates :title, presence: true
  # validates :author, presence: true
  # validates :genre, presence: true
  # validates :description, presence: true
  belongs_to :user, optional: true
end
