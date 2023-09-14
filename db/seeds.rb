# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
Admin.create(email: 'supper_admin@gmail.com', password: 'password@123',password_confirmation: 'password@123')

Role.create(name: :hotel_owner)
Role.create(name: :hotel_manager) 
Role.create(name: :guest)

user = FactoryBot.create(:user, email: 'hotel1_owner@gmail.com', password: 'password@123',password_confirmation: 'password@123')

hotels = FactoryBot.create_list(:hotel, 20, :with_room_type, user_id: user.id)

# Generate data	inventory in 1 year 
RoomType.find_each do |room_type|
	today = DateTime.now
	(0...365).to_a.each  do |i|
		Inventory.create(
			date:  today + i.days,
			total_inventory: room_type.rooms.count,
			total_reserved: 0, 
			hotel_id: room_type.hotel_id, 
			room_type_id: room_type.id
		)
	end
end
