class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable



  has_many :addresses, dependent: :destroy
  has_many :cart_items, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_many :favorites, dependent: :destroy


  def already_favorited?(item)
    self.favorites.exists?(item_id: item.id)
  end

  def full_name
    self.last_name + " " + self.first_name
  end

  #def self.search(search)
    #search ? where('last_name LIKE ? OR first_name LIKE ?', "%#{search}%", "%#{search}%") : all
  #end


  def self.guest
    find_or_create_by!(email: 'guest@test.com') do |user|
      user.password = SecureRandom.urlsafe_base64 # ランダムなパスワードを生成
      user.last_name = 'guest'
      user.first_name = 'user'
      user.last_name_kana = 'げすと'
      user.first_name_kana = 'ゆーざー'
      user.corporation = 'ゲスト株式会社'
      user.postal_code = '0000000'
      user.address = '日本'
      user.telephone_number = '09012345678'

    end
  end

end
