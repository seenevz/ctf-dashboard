
5.times do
  User.create(username: Faker::Name.unique.name, password: "test")
end

2.times do
  Board.create(title: Faker::Hacker.unique.ingverb, owner: User.all.sample)
end

Board.all.each do |board|
  10.times do
    Flag.create(value: Faker::String.random(length: 10), board: board)
  end
end

3.times do
  team = Team.create(name: Faker::Hacker.unique.noun)

  Array(2..4).sample.times do
    Membership.create(user: User.all.sample, team: team)
  end
end

possible_players = Team.all + User.all

Board.all.each do |board|
  tm = possible_players.sample

  GameState.create(board: board, team: tm)
end

puts "\n-------- SEEDED --------\n"