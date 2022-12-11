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

  def falready_favorited?(customer)
    favorites.where(customer_id: customer.id).exists?
  end

  def already_favorited?(general_customer)
    favorites.where(general_customer_id: general_customer.id).exists?
  end

  #def self.search(search)
    #search ? where('item LIKE ?', "%#{search}%") : all
  #end





  has_many :order_detalls, dependent: :destroy
  belongs_to :genre



end
