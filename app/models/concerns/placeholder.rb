module Placeholder
  extend ActiveSupport::Concern

  def self.image_generator(height:, width:)
    "https://via.placeholder.com/#{height}x#{width}/#{SecureRandom.hex(3)}/000000"
  end
end