class User < ApplicationRecord

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable #, :confirmable

#validates :email, :first_name, :last_name, :birthday, :geneder, :phone, presence: true
#validates :email, format: { with: /^[_a-z0-9-]+(\.[_a-z0-9-]+)*@[a-z0-9-]+(\.[a-z0-9-]+)*(\.[a-z]{2,4})$/, without: /test.com$/, message: 'Only emails allowed' }
#validates :email, format: { without: /test.com$/, message: 'Test emails are not allowed' }
#validates :phone, numericality: {only_integer: true, greater_than: 12}
#validates :first_name, uniqueness: {scope: :email, message: 'should only one user with name and email'}

# Include default devise modules. Others available are:
# :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  attr_accessor :email, :password, :password_confirmation
# attr_accessor :city, :city_id
#belongs_to :city
  has_many :bills
  has_many :transactions, through: :bills
  has_many :cards

  scope :user, -> { where role: '0' }
  scope :manager, -> { where role: '1' }
  scope :admin, -> { where role: '2' }

  enum role: [:user, :manager, :admin]
  after_initialize :set_default_role, if: :new_record?

  def approved(bill)
    ApplicationMailer.approved(bill)
  end

  def set_default_role
    self.role ||= :user
  end


end
