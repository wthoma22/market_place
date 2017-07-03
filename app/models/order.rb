class Order < ActiveRecord::Base
  belongs_to :user

  validates :user_id, presence: true
  # validates :total, presence: true, numericality: { greater_than_or_equal_to: 0 }

  has_many :placements
  has_many :products, through: :placements

  before_validation :set_total!

  def set_total!
    self.total = products.map(&:price).sum
  end
end
