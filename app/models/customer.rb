class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :first_kana, presence: true
  validates :last_kana, presence: true
  validates :postal_code, presence: true
  validates :address, presence: true
  validates :tel_number, presence: true

  has_many :cart_items, dependent: :destroy
  has_many :addresses, dependent: :destroy
end
