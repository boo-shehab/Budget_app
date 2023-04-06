class Group < ApplicationRecord
  belongs_to :user
  has_many :entities, dependent: :destroy

  validates :name, presence: true, length: { maximum: 50 }
  validates :icon, presence: true

  after_save :total

  def total
    @sum = 0
    entities.each do |e|
      @sum += e.amount
    end
    @sum
  end
end
