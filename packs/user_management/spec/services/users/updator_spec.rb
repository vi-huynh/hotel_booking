require 'rails_helper'

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

      let(:user)  { 
        user = FactoryBot.create(:user, email: 'email@gmail.com') 
        user.add_role(:client)
        user
      }
      

      it 'update username' do
        new_username = Faker::Name.name.parameterize
        actor = Users::Updator.call(
          user: user, 
          username: new_username,
        )
        
        binding.break  

        user = user.reload 
        expect(user.username).to eq(username_updated)
      end

      it 'update password' do
        new_password = 'password_updated'

        actor = Users::Updator.call(
          user: user, 
          password: new_password,
          password_confirmation: new_password,
        )
        user = user.reload
        expect(user.authenticate(new_password)).to eq(true)
      end

      it 'update role client to admin' do
        actor = Users::Updator.call(
          user: user, 
          roles: 'admin'
        )
        user = user.reload
        expect(user.has_role?(:admin)).to eq(true)
      end

    end 

    context 'when invalid' do 
      let(:user)  { 
        user = FactoryBot.create(:user, email: 'email@gmail.com') 
        user.add_role(:client)
        user
      }

      it 'email invalid' do
        new_username = Faker::Name.name.parameterize
        actor = Users::Updator.result(
          user: user, 
          email: 'abc123',
        )
        expect(actor.sucess?).to eq(false)
        
      end

      it 'password invalid' do
        actor = Users::Updator.result(
          user: user, 
          password: 'abc123',
          password_confirmation: 'abc123',
        )
        expect(actor.sucess?).to eq(false)
      end

      it 'password not same password_confirmation' do
        actor = Users::Updator.result(
          user: user, 
          password: 'abc123',
          password_confirmation: '123abc'
        )
        expect(actor.sucess?).to eq(false)
      end

      it 'role invalid' do
        actor = Users::Updator.result(
          user: user, 
          roles: 'abc'
        )
        expect(actor.sucess?).to eq(false)
      end

    end 
  end
end