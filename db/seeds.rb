# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

track1 = Track.create({name: 'Nurburgring', surface_type: 'asphalt'})
track2 = Track.create({name: 'Brands Hatch', surface_type: 'gravel'})
track3 = Track.create({name: 'Monaco', surface_type: 'snow'})

car1 = Car.create({name: 'Subaru Impreza', max_speed: 120, speed_unit: 'km/h'})
car2 = Car.create({name: 'Porsche 911', max_speed: 220, speed_unit: 'km/h'})

event1 = Event.create({name:'Nurburgring Summer Smash', car: car1, track: track1})
event1 = Event.create({name:'Monaco Grand Prix', car: car1, track: track1})
