class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def name
    [first_name, last_name].compact.join(' ')
  end

  has_many :affiliations
  has_many :organizations, through: :affiliations
  has_many :videos

  def admin?
    role == "admin"
  end

  def regular?
    role == "regular"
  end

  def guest?
    role == "guest"
  end 

end
