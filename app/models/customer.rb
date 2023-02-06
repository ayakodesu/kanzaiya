class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :addresses, dependent: :destroy
  has_many :cart_items, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_many :favorites, dependent: :destroy

  VALID_POSTAL_CODE_REGEX = /\A\d{7}\z/
  VALID_TELEPHONE_NUMBER_REGEX = /\A\d{10,11}\z/

  validates :last_name, presence: true, length: { maximum: 10 }
  validates :first_name, presence: true, length: { maximum: 10 }
  validates :last_name_kana, presence: true, length: { maximum: 20 }
  validates :first_name_kana, presence: true, length: { maximum: 20 }
  validates :corporation, presence: true, length: { maximum: 50 }
  validates :postal_code, presence: true, format: {
                                            with: VALID_POSTAL_CODE_REGEX,
                                            message: "は半角英数７桁で入力して下さい。" }
  validates :address, presence: true, length: { maximum: 100 }
  validates :telephone_number, presence: true, format: {
                                            with: VALID_TELEPHONE_NUMBER_REGEX,
                                            message: "は半角英数10~11桁で入力して下さい。" }
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

# == Schema Information
#
# Table name: customers
#
#  id                     :integer          not null, primary key
#  address                :string           not null
#  corporation            :string           not null
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  first_name             :string           not null
#  first_name_kana        :string           not null
#  is_deleted             :boolean          default(FALSE), not null
#  last_name              :string           not null
#  last_name_kana         :string           not null
#  postal_code            :string           not null
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  telephone_number       :string           not null
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_customers_on_email                 (email) UNIQUE
#  index_customers_on_reset_password_token  (reset_password_token) UNIQUE
#
