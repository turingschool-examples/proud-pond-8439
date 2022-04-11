AmusementPark.destroy_all
Ride.destroy_all
Mechanic.destroy_all
MechanicRide.destroy_all

six_flags = AmusementPark.create!(name: 'Six Flags', admission_cost: 75)
universal = AmusementPark.create!(name: 'Universal Studios', admission_cost: 80)

mechanic1 = Mechanic.create!(name: "Pabu", years_experience: 4)
mechanic2 = Mechanic.create!(name: "Thor", years_experience: 2)
mechanic3 = Mechanic.create!(name: "Loki", years_experience: 6)

hurler = six_flags.rides.create!(name: 'The Hurler', thrill_rating: 7, open: true)
hurler = six_flags.rides.create!(name: 'The Scrambler', thrill_rating: 4, open: true)
hurler = six_flags.rides.create!(name: 'Ferris Wheel', thrill_rating: 7, open: false)

jaws = universal.rides.create!(name: 'Jaws', thrill_rating: 5, open: true)

#MechanicRide.create!(ride_id: jaws.id, mechanic_id: mechanic1.id)
