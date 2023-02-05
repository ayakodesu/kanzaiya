class Customer < ApplicationRecord
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
  validates :corporation, presence: true
  validates :postal_code, presence: true
  validates :address, presence: true
  validates :telephone_number, presence: true
  validates :email, presence: true

  def self.search(search)
    search ? where('last_name LIKE ? OR first_name LIKE ? OR corporation LIKE ? OR address LIKE ?', "%#{search}%","%#{search}%","%#{search}%","%#{search}%") : all
  end

  def already_favorited?(item)
    self.favorites.exists?(item_id: item.id)
  end

  def full_name
    self.last_name + " " + self.first_name
  end

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
