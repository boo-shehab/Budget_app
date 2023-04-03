class Entity < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  has_many :groups

  validates :name, presence: true, length: { maximum: 50 }
  validates :amount, presence: true
end
