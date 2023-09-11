module Users
  class Updator < ApplicationService
    input :user
    input :username, default: nil
    input :password, default: nil
    input :password_confirmation, default: nil
    input :role, default: nil

    output :user 

    def call 
      ActiveRecord::Base.transaction do 
        update_basic_user
        update_password
        update_roles
      end
      self.user = user
    rescue => e 
      fail!(error: e.message)
    end

    private
    def update_roles 
      user.add_role(role.to_sym)
    end 

    def update_basic_user
      user.update!(username: username)
    end
    
    def update_password
      if password.present? && password_confirmation.present?
        user.password = password
        user.password_confirmation = password_confirmation
        user.save!
      end 
    end 
  end 
end 