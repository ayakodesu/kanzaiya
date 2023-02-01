class Item < ApplicationRecord

  has_one_attached :image

  validates :image, presence: true
  validates :name, presence: true
  validates :amount, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 0}
  validates :last_price, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 0}

  def with_tax_price
    (last_price * 1.1).floor
  end

  has_many :cart_items, dependent: :destroy
  has_many :favorites, dependent: :destroy
  belongs_to :customer, optional: true
  belongs_to :general_customer, optional: true
  has_many :order_detalls, dependent: :destroy
  belongs_to :genre

  def self.search(search)
    search ? where('name LIKE ? OR size LIKE ? OR shape LIKE ?' ,"%#{search}%","%#{search}%","%#{search}%") : all
  end


  def favorited_by?(customer)
    favorites.exists?(customer_id: customer.id)
  end

  def favorited_by?(general_customer)
    favorites.exists?(general_customer_id: general_customer.id)
  end

  def cart_item_amount_cannot_be_greater_than_item_amount
    if amount > item.amount
      errors.add(:amount, "※在庫合計数よりを注文数が多いです。")
    end
  end

end
