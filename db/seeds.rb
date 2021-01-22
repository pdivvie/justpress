User.create!(
  email: "pdivvie@outlook.com",
  username: "admin",
  password: "password",
  password_confirmation: "password"
)

puts "1 user created with username 'admin' and password 'password'\nRun 'User.find_by(username: 'admin').add_role :admin' \nin rails console to make user an admin"

User.create!(
  email: "test@test.com",
  username: "test",
  password: "password",
  password_confirmation: "password"
)

puts "1 test user created with username 'test' and password 'password'"

2.times do |topic|
  Topic.create!(
    title: "Topic #{topic}"
    )
end

puts "2 topics created"

3.times do |game|
  Game.create!(
    title: "Game #{game}",
    description: "Lorem Ipsum etc etc Lorem Ipsum etc etc Lorem Ipsum etc etc Lorem Ipsum etc etc",
    cover_image: "https://via.placeholder.com/150"
		)
end

puts "3 games created"
