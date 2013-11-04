class Restaurant < ActiveRecord::Base
	validates :name, presence: true,
                    length: { minimum: 2 }
    mount_uploader :image, ImageUploader
end
