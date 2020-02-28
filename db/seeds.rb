
Flag.destroy_all
Board.destroy_all
User.destroy_all

5.times do
  User.create(username: Faker::Name.unique.name, password: "test")
end

2.times do
  Board.create(title: Faker::Hacker.unique.ingverb, user: User.all.sample)
end

Board.all.each do |board|
  10.times do
    Flag.create(value: Faker::String.random(length: 10), board: board)
  end
end

puts "\n-------- SEEDED --------\n"