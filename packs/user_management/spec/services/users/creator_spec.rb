require 'rails_helper'

RSpec.describe Users::Creator, type: :service do
  describe '#create' do
    context 'when valid' do 
      let (:params_user)  do 
        { 
          username: Faker::Name.name.parameterize,
          email: Faker::Internet.email,
          password: 'password',
          password_confirmation: 'password'
        }
      end

      it 'create a admin user' do
        actor = Users::Creator.call(params_user, role: 'admin')
        expect(actor.user.has_role?(:admin)).to eq(true)
      end

      it 'create a client user' do
        actor = Users::Creator.call(params_user, role: 'client')
        expect(actor.user.has_role?(:client)).to eq(true)
      end

    end 

    context 'when invalid' do 
    
      before do 
        user = FactoryBot.create(:user, email: 'example@gmail.com')
      end 

      it 'does not create a user with existing email' do
        actor = Users::Creator.result(
          username: Faker::Name.name.parameterize,
          email: 'example@gmail.com',
          password: 'password',
          password_confirmation: 'password',
          role: 'admin'
        )

        expect(actor.sucess?).to eq(nil)
      end

      it 'does not create a user with invalid email' do
        actor = Users::Creator.result(
          username: Faker::Name.name.parameterize,
          email: 'example@gmail',
          password: 'password',
          password_confirmation: 'password',
          role: 'client'
        )

        expect(actor.sucess?).to eq(nil)
      end

      it 'does not create a user invalid password' do
        actor = Users::Creator.result(
          username: Faker::Name.name.parameterize,
          email: 'example@gmail',
          password: 'password',
          password_confirmation: 'password123',
          role: 'client'
        )
        
        expect(actor.sucess?).to eq(nil)
      end
    end 
  end
end