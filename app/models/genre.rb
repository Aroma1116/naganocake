class Genre < ApplicationRecord

  validates :genre, presence: :true
end
