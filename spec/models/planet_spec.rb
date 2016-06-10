require 'rails_helper'

RSpec.describe Planet, type: :model do
  context 'with an empty name' do
    it 'doesnt allow the planet to be created' do
      p = Planet.new(name: '')
      p.valid?
      expect(p.errors.messages).to have_key(:name)
    end
  end

  context 'with an invalid type' do
    it 'doesnt allow the planet to be created' do
      p = Planet.new(planet_type: 'whatever')
      p.valid?
      expect(p.errors.messages).to have_key(:planet_type)
    end
  end

  context 'with no star' do
    it 'doesnt allow the planet to be created' do
      p = Planet.new
      p.valid?
      expect(p.errors.messages).to have_key(:star)
    end
  end

  context 'with valid informations' do
    it 'allows the planet to be created' do
      p = Planet.new(name: 'Earth', planet_type: 'Telluric',
        star: Star.create(name: 'Sun'))
      p.valid?
      expect(p.errors.messages).to be_empty
    end
  end
end
