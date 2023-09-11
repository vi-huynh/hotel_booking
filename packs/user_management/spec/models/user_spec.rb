require 'rails_helper'

RSpec.describe User, :type => :model do
  context  'valid' do 
    it 'valid username, email , password' do
      user = User.new(
        username: Faker::Name.name.parameterize,
        email: Faker::Internet.email,
        password: 'password',
        password_confirmation: 'password'
      )

      expect(user).to be_valid
    end
  end

  context  'invalid' do 
    it 'username is blank' do
      user = User.new(
        username: '',
        email: Faker::Internet.email,
        password: 'password',
        password_confirmation: 'password'
      )

      expect(user).to be_invalid
    end

    it 'email is blank' do
      user = User.new(
        username: Faker::Name.name.parameterize,
        email: '',
        password: 'password',
        password_confirmation: 'password'
      )

      expect(user).to be_invalid
    end

    it 'email is invalid format' do
      user = User.new(
        username: Faker::Name.name.parameterize,
        email: 'Faker::Internet.email',
        password: 'password',
        password_confirmation: 'password'
      )

      expect(user).to be_invalid
    end

    it 'password is blank' do
      user = User.new(
        username: Faker::Name.name.parameterize,
        email: Faker::Internet.email,
        password: '',
        password_confirmation: ''
      )

      expect(user).to be_invalid
    end

    it 'password is not match with password_confirmation' do
      user = User.new(
        username: Faker::Name.name.parameterize,
        email: Faker::Internet.email,
        password: 'password',
        password_confirmation: 'password123'
      )

      expect(user).to be_invalid
    end

    it 'length of password less than 8' do
      user = User.new(
        username: Faker::Name.name.parameterize,
        email: Faker::Internet.email,
        password: 'abc123',
        password_confirmation: 'abc123'
      )

      expect(user).to be_invalid
    end
  end
end