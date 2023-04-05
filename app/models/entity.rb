class Entity < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :groups, dependent: :destroy
  validates :name, presence: true, length: { maximum: 50 }
  validates :amount, presence: true, numericality: { only_integer: true }
end
