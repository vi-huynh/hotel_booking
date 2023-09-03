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

      it 'creates a admin user' do
        actor = Users::Creator.call(params_user, role: 'admin')
        expect(actor.user.has_role?(:admin)).to eq(true)
      end

      it 'creates a client user' do
        actor = Users::Creator.call(params_user, role: 'client')
        expect(actor.user.has_role?(:admin)).to eq(false)
      end

    end 

    context 'when invalid' do 
      let (:params_user)  do 
        { 
          username: Faker::Name.name.parameterize,
          email: 'example@gmail.com',
          password: 'password',
          password_confirmation: 'password'
        }
      end

      it 'does not create a user' do
        user = FactoryBot.create(:user, email: 'example@gmail.com')
        
        actor = Users::Creator.result(params_user, role: 'admin')
        expect(actor.sucess?).to eq(nil)
      end

      it 'does not create a client' do
        user = FactoryBot.create(:user, email: 'example@gmail.com')
        
        actor = Users::Creator.result(params_user, role: 'client')
        expect(actor.sucess?).to eq(nil)
      end
    end 
  end
end