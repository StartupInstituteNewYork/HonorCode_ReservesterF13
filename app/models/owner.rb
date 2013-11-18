class Owner < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  attr_accessible :email, :password, :password_confirmation, :remember_me
  
  #validates :name, presence: true
  
  has_many :restaurants
end
