class Product < ApplicationRecord
    has_one_attached :image
    belongs_to :admin, optional: true
    validates :name, :price, :description, :image, presence: true
    validates :price, numericality: { greater_than_or_equal_to: 0 }
    validate :acceptable_image

    def acceptable_image
        return unless image.attached?
      
        unless image.byte_size <= 2.megabyte
          errors.add(:image, "is too big")
        end

        acceptable_types = ["image/jpeg", "image/png"]
        unless acceptable_types.include?(image.content_type)
            errors.add(:image, "must be a JPEG or PNG")
        end
    end

    before_save :set_current_user

    def set_current_user 
        self.admin = Current.user
    end
end
