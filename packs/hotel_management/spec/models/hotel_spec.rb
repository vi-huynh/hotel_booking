require 'rails_helper'

RSpec.describe Hotel, :type => :model do
  context  'valid' do 
    let(:user) { FactoryBot.create(:user) }
    let(:create_hotel) { 
      FactoryBot.create(
        :hotel, 
        name: Faker::Name.name,
        address: Faker::Address.street_address,
        user: user
      )
    }
    
    it 'name, address, user' do
      hotel = Hotel.new(
        name: Faker::Name.name,
        address: Faker::Address.street_address,
        user: user
      )
      expect(hotel).to be_valid
    end

    # Todo fixing issue RELEASE SAVEPOINT in Postgres
    it 'slug is unique' do 
      slug = create_hotel.slug
      new_hotel = Hotel.new(
        slug: slug,
        name: Faker::Name.name,
        address: Faker::Address.street_address,
        user: user
      )
      expect(new_hotel).to be_invalid
    end
  end

  context  'invalid' do 
    let(:user) { FactoryBot.create(:user) }

    it 'name is blank' do
      hotel = Hotel.new(
        name: nil,
        address: Faker::Address.street_address,
        user: user
      )
      expect(hotel).to be_invalid
    end

    it 'address is blank' do
      hotel = Hotel.new(
        name: Faker::Name.name,
        address: nil,
        user: user
      )
      expect(hotel).to be_invalid
    end

    it 'user is blank' do
      hotel = Hotel.new(
        name: Faker::Name.name,
        address: Faker::Address.street_address
      
      )
      expect(hotel).to be_invalid
    end
  end
end