class Item < ApplicationRecord

  has_one_attached :image

  def betting_rate
    (last_price * 0.5).floor
  end

  def with_tax_price
    (last_price * 1.1).floor
  end




  has_many :cart_items, dependent: :destroy
  has_many :favorites, dependent: :destroy

  #has_one :customer, optional: true
  #has_one :general_customer, optional: true

  #def favorited_by?(customer)
    #favorites.exists?(customer_id: customer.id)
  #end





  has_many :order_detalls, dependent: :destroy
  belongs_to :genre



end
