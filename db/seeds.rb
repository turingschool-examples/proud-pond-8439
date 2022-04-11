Ride.destroy_all
AmusementPark.destroy_all
Mechanic.destroy_all

six_flags = AmusementPark.create!(name: 'Six Flags', admission_cost: 75)
universal = AmusementPark.create!(name: 'Universal Studios', admission_cost: 80)

hurler = six_flags.rides.create!(name: 'The Hurler', thrill_rating: 7, open: true)
scrambler = six_flags.rides.create!(name: 'The Scrambler', thrill_rating: 4, open: true)
ferris = six_flags.rides.create!(name: 'Ferris Wheel', thrill_rating: 7, open: false)

jaws = universal.rides.create!(name: 'Jaws', thrill_rating: 5, open: true)

mechanic_1 = Mechanic.create!(name: "Joey Simpson", years_experience: 5)
mechanic_2 = Mechanic.create!(name: "Dolly Jackson", years_experience: 16)
mechanic_3 = Mechanic.create!(name: "Mac Berger", years_experience: 12)
mechanic_4 = Mechanic.create!(name: "Red Valance", years_experience: 24)
