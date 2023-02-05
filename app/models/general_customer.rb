class GeneralCustomer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :addresses, dependent: :destroy
  has_many :cart_items, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_many :favorites, dependent: :destroy

  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :last_name_kana, presence: true
  validates :first_name_kana, presence: true
  validates :postal_code, presence: true
  validates :address, presence: true
  validates :telephone_number, presence: true
  validates :email, presence: true

 def self.search(search)
    search ? where('last_name LIKE ? OR first_name LIKE ? OR address LIKE ?', "%#{search}%","%#{search}%","%#{search}%") : all
 end

 def full_name
   self.last_name + " " + self.first_name
 end

 def already_favorited?(item)
   self.favorites.exists?(item_id: item.id)
 end

end
