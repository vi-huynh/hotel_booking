module Users
  class Creator < ApplicationService
    input :username
    input :email
    input :password
    input :password_confirmation
    input :role

    output :user 

    attr_reader :user

    def call 
      ActiveRecord::Base.transaction do 
        create_user
        set_role
      end
      send_notification if user.persisted?
      self.user = user
    rescue => e 
      fail!(error: e.message)
    end

    private 
    def create_user
      @user = User.new(username: username, 
                       email: email, 
                       password: password,
                       password_confirmation: password_confirmation)
      @user.save!
    end

    def set_role
      if role == 'admin'
        user.add_role(:admin)
      else
        user.add_role(:client)
      end
    end

    def send_notification
      # todo
    end 
  end 
  
end 