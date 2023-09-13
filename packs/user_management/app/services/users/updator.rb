module Users
  class Updator < ApplicationService
    fail_on ServiceActor::ArgumentError
    
    input :user
    input :username, default: nil
    input :password, default: nil
    input :password_confirmation, default: nil
    input :email, default: nil
    input :role, inclusion:  %w(hotel_manager hotel_owner guest), default: 'guest'

    output :user 

    def call 
      ActiveRecord::Base.transaction do 
        update_basic_user if username.present?
        update_password if password.present?
        update_role if role.present?
        update_email if email.present? 
      end
      self.user = user
    end

    private

    def update_email 
      unless user.update(email: email)
        fail!(error: "Failed update email")
      end
    end 
    def update_role 
      user.add_role(role.to_sym)
    end 

    def update_basic_user
      unless user.update(username: username)
        fail!(error: "Failed update username")
      end
    end
    
    def update_password
      user.password = password
      user.password_confirmation = password_confirmation
      fail!(error: 'Failed update password') unless user.save
    end 
  end 
end 