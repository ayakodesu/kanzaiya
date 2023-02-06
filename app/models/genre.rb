class Genre < ApplicationRecord
  validates :name, presence: true, length: { maximum: 20 }
  has_many :items, dependent: :destroy
end

# == Schema Information
#
# Table name: genres
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
