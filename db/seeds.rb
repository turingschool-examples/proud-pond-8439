AmusementPark.destroy_all
Ride.destroy_all

six_flags = AmusementPark.create!(name: 'Six Flags', admission_cost: 75)
universal = AmusementPark.create!(name: 'Universal Studios', admission_cost: 80)

john = Mechanic.create!(name: "John", years_experience:1)
paul = Mechanic.create!(name: "Paul", years_experience:2)

hurler = six_flags.rides.create!(name: 'The Hurler', thrill_rating: 7, open: true)
hurler = six_flags.rides.create!(name: 'The Scrambler', thrill_rating: 4, open: true)
hurler = six_flags.rides.create!(name: 'Ferris Wheel', thrill_rating: 7, open: false)

jaws = universal.rides.create!(name: 'Jaws', thrill_rating: 5, open: true)
