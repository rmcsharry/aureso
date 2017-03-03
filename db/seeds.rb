# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Track.create({name: 'Nurburgring', surface_type: 'asphalt'})
Track.create({name: 'Brands Hatch', surface_type: 'gravel'})
Track.create({name: 'Monaco', surface_type: 'snow'})

Car.create({name: 'Subaru Impreza', max_speed: '120km/h'})
Car.create({name: 'Porsche 911', max_speed: '220km/h'})