class Planet < ActiveRecord::Base
  belongs_to :star

  validates :name, presence: true, length: { minimum: 2 }
  validate :has_valid_type
  validates :star, presence: true

  def self.valid_types
    ['Gaseous', 'Telluric']
  end

  private

  def has_valid_type
    unless Planet.valid_types.include?(planet_type)
      errors.add(:planet_type, "must be one of : #{Planet.valid_types}")
    end
  end
end
