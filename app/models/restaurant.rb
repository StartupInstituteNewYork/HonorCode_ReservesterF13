class Restaurant < ActiveRecord::Base
	validates :name, presence: true,
                    length: { minimum: 2 }
    mount_uploader :image, ImageUploader
    belongs_to :owner
    mount_uploader :menu, MenuUploader
end
