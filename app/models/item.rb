class Item < ApplicationRecord

  has_one_attached :image


  def with_tax_price
    (last_price * 1.1).floor
  end


  has_many :cart_items, dependent: :destroy
  has_many :favorites, dependent: :destroy
  belongs_to :customer, optional: true
  belongs_to :general_customer, optional: true
  has_many :order_detalls, dependent: :destroy
  belongs_to :genre



  def favorited_by?(customer)
    favorites.exists?(customer_id: customer.id)
  end

  def favorited_by?(general_customer)
    favorites.exists?(general_customer_id: general_customer.id)
  end







end
