require 'rails_helper'

RSpec.describe	UsersController,	type:	:controller	do
	describe "#index" do
    context	'when logged in'	do
      before	do
        @admin =	FactoryBot.create(:admin)
      end

      it 'responds with 200'	do
        sign_in	@admin
        get	:index
        expect(response).to	have_http_status	200
      end
    end

    context	'when logged out'	do
      before	do
        @admin	=	FactoryBot.create(:admin)
      end

      it 'responds with 302'	do
        get	:index
        expect(response).to	have_http_status	302
      end
    end

    context	'when dont have permission'	do
      before	do
        @user	=	FactoryBot.create(:user)
      end

      it 'redirects to root url'	do
        sign_in	@user
        get	:index
        expect(response).to	 have_http_status	302
      end
    end
	end
end
