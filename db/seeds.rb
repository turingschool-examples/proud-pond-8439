AmusementPark.destroy_all
Ride.destroy_all

six_flags = AmusementPark.create!(name: "Six Flags", admission_cost: 75)
universal = AmusementPark.create!(name: "Universal Studios", admission_cost: 80)
kings_island = AmusementPark.create!(name: "Kings Island", admission_cost: 50)

hurler = six_flags.rides.create!(name: "The Hurler", thrill_rating: 7, open: true)
hurler = six_flags.rides.create!(name: "The Scrambler", thrill_rating: 4, open: true)
hurler = six_flags.rides.create!(name: "Ferris Wheel", thrill_rating: 7, open: false)

jaws = universal.rides.create!(name: "Jaws", thrill_rating: 5, open: true)

yak = kings_island.rides.create!(name: "Yackity Yak", thrill_rating: 9, open: true)
bruiser = kings_island.rides.create!(name: "Bruiser", thrill_rating: 5, open: false)
zoomer = kings_island.rides.create!(name: "Zoomer", thrill_rating: 10, open: true)
eeek = kings_island.rides.create!(name: "EEEEEK!", thrill_rating: 3, open: true)

mech = Mechanic.create!(name: "Mech", years_experience: 2)
stan = Mechanic.create!(name: "Stan", years_experience: 25)
boris = Mechanic.create!(name: "Boris", years_experience: 12)

mech_ride_1 = RideMechanic.create!(mechanic_id: mech, ride_id: roller)
mech_ride_2 = RideMechanic.create!(mechanic_id: boris, ride_id: bruiser)
mech_ride_3 = RideMechanic.create!(mechanic_id: boris, ride_id: yak)
