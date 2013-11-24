class Restaurant < ActiveRecord::Base
  
  attr_accessible :name, :description, :address1, :address2,
                    :city, :state, :zip, :phone, :image, :menu
	validates :name, presence: true,
	            length: { minimum: 3 }, uniqueness: { case_sensitive: false }
  validates :phone, presence: true
  validates :image, presence: true
  
  mount_uploader :image, ImageUploader
  mount_uploader :menu, MenuUploader
  
  belongs_to :owner 
end
