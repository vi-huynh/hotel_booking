require 'rails_helper'

RSpec.describe	ManagementUsersController,	type:	:controller	do
	describe "#index" do
    context	'when logged in'	do
      before	do
        @user	=	FactoryBot.create(:user)
        Role.create(name: :admin)
        @user.add_role(:admin)
      end

      it 'responds with 200'	do
        sign_in	@user
        get	:index
        expect(response).to	have_http_status	200
      end
    end

    context	'when logged out'	do
      before	do
        @user	=	FactoryBot.create(:user)
        Role.create(name: :admin)
        @user.add_role(:admin)
      end

      it 'responds with 302'	do
        get	:index
        expect(response).to	have_http_status	302
      end
    end

    context	'when dont have permission'	do
      before	do
        @user	=	FactoryBot.create(:user)
        Role.create(name: :client)
        @user.add_role(:client)
      end

      it 'redirects to root url'	do
        sign_in	@user
        get	:index
        expect(response).to	 redirect_to(root_url)
      end
    end
	end
end
