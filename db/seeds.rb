puts "Seeds started"

start_time = Time.now

User.create(username: "test", password: "ten_char_password", password_confirmation: "ten_char_password")

if ENV["RAILS_ENV"] == "development" || ENV["STAGING_APP"]
  10.times do
    User.create(username: Faker::Name.unique.name, password: "ten_char_password", password_confirmation: "ten_char_password")
  end

  50.times do
    Board.create(title: Faker::Hacker.ingverb, owner: User.all.sample)
  end

  Board.all.each do |board|
    10.times do
      Flag.create(value: Faker::String.random(length: 10), board: board)
    end
  end

  5.times do
    team = Team.create(name: Faker::Hacker.unique.noun)

    Array(2..4).sample.times do
      Membership.create(user: User.all.sample, team: team)
    end
  end

  possible_players = Team.all + User.all

  Board.all.each do |board|
    GameState.create(board: board, teamable: possible_players.sample)
  end
end

end_time = Time.now

total_time = end_time - start_time

minutes = (total_time / 60).to_int

seconds = (total_time % 60).to_int

puts "\n-------- SEEDED --------\n"
puts "Seeding took #{ "#{minutes} mins and" if minutes > 0 } #{seconds} secs"
