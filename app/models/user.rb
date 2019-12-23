class User < ApplicationRecord

  #validates :email, format: { with: /^[_a-z0-9-]+(\.[_a-z0-9-]+)*@[a-z0-9-]+(\.[a-z0-9-]+)*(\.[a-z]{2,4})$/, message: 'Only emails allowed' }
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  attr_accessor :city, :city_id
  belongs_to :city
  has_many :bills
  has_many :cards
  validates :email, presence: true
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
end
