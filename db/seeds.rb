user = User.last
Sport.destroy_all

#profiles
profile = Profile.create(first_name: "Your Session", user: user)
attributes = {
  certificates: "My certificates",
  bio: "My Bio",
  education: "My education",
  description: "My description",
}
profile.trainer = Trainer.new(attributes)
profile.save!
#requester = Profile.create(first_name: "I want to be a trainer", user: user)

#sports
yoga = Sport.create(name: "Yoga", tagline: "Boring sheet", description: "You need to be flexible man...")
url = "http://res.cloudinary.com/dvhelys1s/image/upload/v1491328960/gfkd0vtljwxhc2dvkq0w.jpg"
yoga.remote_banner_sport_picture_url = url
yoga.save!

bootcamp = Sport.create(name: "Bootcamp", tagline: "Bounce the ball", description: "We love Maria")
url = "http://res.cloudinary.com/dvhelys1s/image/upload/v1491328960/gfkd0vtljwxhc2dvkq0w.jpg"
bootcamp.remote_banner_sport_picture_url = url
bootcamp.save!

boxing = Sport.create(name: "Boxing", tagline: "Have a punch", description: "You really need to like bruises")
url = "http://res.cloudinary.com/dvhelys1s/image/upload/v1491328960/gfkd0vtljwxhc2dvkq0w.jpg"
boxing.remote_banner_sport_picture_url = url
boxing.save!

running = Sport.create(name: "Running", tagline: "Run forest run !", description: "A bit useless but enjoyeable")
url = "http://res.cloudinary.com/dvhelys1s/image/upload/v1491328960/gfkd0vtljwxhc2dvkq0w.jpg"
running.remote_banner_sport_picture_url = url
running.save!

dancing = Sport.create(name: "Dancing", tagline: "Dance baby!", description: "Dance with Jennifer")
url = "http://res.cloudinary.com/dvhelys1s/image/upload/v1491328960/gfkd0vtljwxhc2dvkq0w.jpg"
dancing.remote_banner_sport_picture_url = url
dancing.save!

# # #training
# yoga_training = Training.create(latitude: 52.362886, longitude: 4.915362, profile: profile, sport: yoga, title: "Yoga Training"         , price: 10, city: "Amsterdam", group_capacity: 5, level: "difficult", outdoor: true, description: "Outdoor training in vondelpark with Jennifer", date: Date.today, time: Time.now, address: "Sarphatistraat 105, Amsterdam", duration: 60)
# tennis_training = Training.create(latitude: 52.359838, longitude: 4.863829, profile: profile, sport: tennis, title: "Tennis Training"   , price: 35, city: "Amsterdam", group_capacity: 6, level: "difficult", outdoor: true, description: "Outdoor training in vondelpark with Jennifer", date: Date.today, time: Time.now, address: "Sarphatistraat 5, Amsterdam", duration: 60)
# boxing_training = Training.create(latitude: 52.348110, longitude: 4.904577, profile: profile, sport: boxing, title: "Boxing Training"   , price: 10, city: "Amsterdam", group_capacity: 8, level: "difficult", outdoor: true, description: "Outdoor training in vondelpark with Jennifer", date: Date.today, time: Time.now, address: "Sarphatistraat 205, Amsterdam", duration: 60)
# running_training = Training.create(latitude: 52.379128, longitude: 4.900272, profile: profile, sport: running, title: "Running Training", price: 8,  city: "Amsterdam", group_capacity: 2, level: "difficult", outdoor: true, description: "Outdoor training in vondelpark with Jennifer", date: Date.today, time: Time.now, address: "Sarphatistraat 80, Amsterdam", duration: 60)

# # #bookings
# yoga_booking = Booking.create(training: yoga_training, participants: 2, profile: profile)
# tennis_booking = Booking.create(training: tennis_training, participants: 2, profile: profile)
# boxing_booking = Booking.create(training: boxing_training, participants: 3, profile: profile)
# running_booking = Booking.create(training: running_training, participants: 1, profile: profile)

# # #reviews
# yoga_review = Review.create(booking: yoga_booking, profile: profile      , content: "this is great", rating: 4)
# tennis_review = Review.create(booking: tennis_booking, profile: profile  , content: "this is great", rating: 4)
# boxing_review = Review.create(booking: boxing_booking, profile: profile  , content: "this is great", rating: 4)
# running_review = Review.create(booking: running_booking, profile: profile, content: "this is great", rating: 4)

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
