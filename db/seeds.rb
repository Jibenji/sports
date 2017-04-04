# Profile.destroy_all
# Sport.destroy_all
# Training.destroy_all
# Booking.destroy_all
# Review.destroy_all

#users
user = User.last

#profiles
profile = Profile.create(first_name: "Your Session", user: user)
#requester = Profile.create(first_name: "I want to be a trainer", user: user)

#sports
yoga = Sport.create(name: "Yoga", tagline: "Boring sheet", description: "You need to be flexible man...", banner_sport_picture: "image/upload/v1491328960/gfkd0vtljwxhc2dvkq0w.jpg")
yoga.save!
# tennis = Sport.create(name: "Tennis", tagline: "Bounce the ball", description: "We love Maria", banner_sport_picture: "image/upload/v1491328855/m0wnlxdholdjguy2h9vx.jpg")
# boxing = Sport.create(name: "Boxing", tagline: "Have a punch", description: "You really need to like bruises", banner_sport_picture: "image/upload/v1491328720/m3i5ddcdlwopaqdsgjiq.jpg")
# running = Sport.create(name: "Running", tagline: "Run forest run !", description: "A bit useless but enjoyeable", banner_sport_picture: "image/upload/v1491328912/y4qawhgl3k3pfcl8jsnp.jpg")

# #trainings
# yoga_training = Training.create(profile: profile, sport: yoga, title: "Yoga Training"         , price: 10, city: "Amsterdam")
# tennis_training = Training.create(profile: profile, sport: tennis, title: "Tennis Training"   , price: 35, city: "Amsterdam")
# boxing_training = Training.create(profile: profile, sport: boxing, title: "Boxing Training"   , price: 10, city: "Amsterdam")
# running_training = Training.create(profile: profile, sport: running, title: "Running Training", price: 8, city: "Amsterdam")

# #bookings
# yoga_booking = Booking.create(training: yoga_training, participants: 7, profile: profile)
# tennis_booking = Booking.create(training: tennis_training, participants: 2, profile: profile)
# boxing_booking = Booking.create(training: boxing_training, participants: 3, profile: profile)
# running_booking = Booking.create(training: running_training, participants: 5, profile: profile)

# #reviews
# yoga_review = Review.create(booking: yoga_booking, profile: profile)
# tennis_review = Review.create(booking: tennis_booking, profile: profile)
# boxing_review = Review.create(booking: boxing_booking, profile: profile)
# running_review = Review.create(booking: running_booking, profile: profile)

# #requests
# #request = Request.create(banner_picture: , bio: "I've been a requester all my life", description: "Requester's description")




# puts "profile.to_json"
# puts profile.to_json

# puts "yoga.to_json"
# puts yoga.to_json

# puts "tennis_training.to_json"
# puts tennis_training.to_json

# puts "running_training.to_json"
# puts running_training.to_json

# puts "boxing_review.to_json"
# puts boxing_review.to_json
