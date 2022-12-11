class Genre < ApplicationRecord

  has_many :items, dependent: :destroy

  def self.search(search)
    search ? where('name LIKE ?', "%#{search}%") : all
  end

end
