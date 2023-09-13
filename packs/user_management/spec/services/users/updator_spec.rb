require 'rails_helper'
require 'debug'

RSpec.describe Users::Updator, type: :service do
  describe '#update' do
    context 'when valid' do 
      let (:params_user)  do 
        { 
          username: 'username_updated',
          email: 'email@gmail.com',
          password: 'password',
          password_confirmation: 'password'
        }
      end

      let(:user)  { FactoryBot.create(:user, email: 'email@gmail.com') }
      
      it 'update username' do
        new_username = Faker::Name.name.parameterize
        actor = Users::Updator.result(
          user: user, 
          username: new_username
        )
        
        expect(actor.user.username).to eq(new_username)
      end

      it 'update password' do
        new_password = 'password_updated'

        actor = Users::Updator.call(
          user: user, 
          password: new_password,
          password_confirmation: new_password
        )
        expect(actor.user.valid_password?(new_password)).to eq(true)
      end

      it 'update role to hotel_owner' do
        actor = Users::Updator.call(
          user: user, 
          role: 'hotel_owner'
        )
        expect(actor.user.has_role?(:hotel_owner)).to eq(true)
      end

      it 'update role to hotel_manager' do
        actor = Users::Updator.call(
          user: user, 
          role: 'hotel_manager'
        )
        expect(actor.user.has_role?(:hotel_manager)).to eq(true)
      end

    end 

    context 'when invalid email' do 
      let(:user)  { FactoryBot.create(:user, email: 'email@gmail.com') } 
      subject(:result)  {
        Users::Updator.result(
        user: user, 
        email: 'abc123'
        ) 
      }
      it '#failure' do
        expect(result.failure?).to eq(true)
      end

      it 'not update email' do
        expect(result.user.reload.email).to eq('email@gmail.com')
      end
    end

    context 'when invalid password' do 
      let(:user)  { FactoryBot.create(:user, email: 'email@gmail.com') } 
      subject(:result)  {
        Users::Updator.result(
          user: user, 
          password: 'abc123',
          password_confirmation: 'abc123',
        ) 
      }

      it '#failure' do
        expect(result.failure?).to eq(true)
      end

      it '#failure' do
        expect(result.error).to eq('Failed update password')
      end

      it 'password not same password_confirmation' do
        actor = Users::Updator.result(
          user: user, 
          password: 'abc123',
          password_confirmation: '123abc'
        )
        expect(actor.failure?).to eq(true)
      end
    end
    
    context 'when invalid role' do 
      let(:user)  { FactoryBot.create(:user, email: 'email@gmail.com') } 

      it 'role invalid' do
        actor = Users::Updator.result(
          user: user, 
          role: 'abc'
        )
        expect(actor.failure?).to eq(true)
      end
    end 
  end
end