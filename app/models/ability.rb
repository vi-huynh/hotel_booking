# frozen_string_literal: true

# == Schema Information
#
# Table name: rooms
#
#  bed_count            :integer
#  is_available         :boolean
#  max_adults_allowed   :integer
#  max_children_allowed :integer
#  rom_number           :string
#  room_description     :text
#  room_max_occupancy   :integer
#  room_price           :decimal(, )
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  hotel_id             :bigint
#  room_id              :bigint           primary key
#  room_type_id         :bigint
#
class Ability
  include CanCan::Ability

  def initialize(user)
    return can :manage, :all if user.is_a?(Admin)
    return can :read, Room if user.roles.blank?

    can :manage, [Hotel, User], user_id: user.id if user.hotel_owner? 
    can :manage, [Hotel], user_id: user.id if user.hotel_manager? 

    can [:create, :update], Reservation 
    #
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, published: true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/blob/develop/docs/define_check_abilities.md
  end
end
