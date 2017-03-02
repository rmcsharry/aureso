class Car < ApplicationRecord
  include FriendlyId
  
  friendly_id :name, use: :slugged

  # before_validation :set_a_slug
  
  # def set_a_slug
  #   if self.slug.nil?
  #     self.slug = SecureRandom.urlsafe_base64(5)
  #   end
  # end

  validates_presence_of :name
  validates_uniqueness_of :name
end
