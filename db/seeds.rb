# Profile.destroy_all
# Sport.destroy_all
# Training.destroy_all
# Booking.destroy_all
# Review.destroy_all



user = User.last
profile = Profile.create(first_name: "John", user: user)
sport = Sport.create(name: "tennis")
training = Training.create(profile: profile, sport: sport, title: "test")
tennis_session = Booking.create(training: training, participants: 3, profile: profile)
review = Review.create(booking: tennis_session, profile: profile)




puts "profile.to_json"
puts profile.to_json

puts "sport.to_json"
puts sport.to_json

puts "training.to_json"
puts training.to_json

puts "tennis_session.to_json"
puts tennis_session.to_json

puts "review.to_json"
puts review.to_json
