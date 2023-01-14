class Genre < ApplicationRecord

  has_many :items, dependent: :destroy

  def self.search(search)
    search ? where('name LIKE ?', "%#{search}%") : all
  end

  #def search
    #@items = Items.where('genre_id LIKE ?', "%#{params[:name]}%")
  #end


end
