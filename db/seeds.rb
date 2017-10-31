# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

InsulationType.destroy_all
Accessory.destroy_all

accessory = [
   'Knives & Blades',
   'A11 Staples',
   'Brooms',
   'Standard Staple Hammer',
   'Heavy Staple Hammer',
   'Strapping',
   'Pokers',
   'Foam & Guns',
   'Long Foam Gun',
   'Hammer',
   'Pneumatic Guns & Staples',
   'Compressor & Hose',
   'Vacuum Cleaner',
   'Extractor Cleaner',
   'Gas Can',
   "4' Ladder",
   "6' Ladder",
   "8' Ladder",
   'Extension Ladder',
   'Scaffolding',
   'Mini Scaffolding',
   'Lights',
   'Head Lamps',
   'Extension Cords',
   'Subfloor Netting',
   'Bibs Netting',
   'Membrain',
   'Attic Rulers',
   'Tape',
   'Atti-Cat Machine'   
]

insulation = [
   ['IFSK191648K', 106.66, 19, 5.5, 16, 'FSK', 54.94],
   ['IFSK302448K', 48, 30, 10, 24, 'FSK', 65.353],
   ['IK131593K', 107.71, 13, 3.5, 15, 'Kraft', 21.11],
   ['IK132394K', 165.15, 13, 3.5, 23, 'Kraft', 29.79],
   ['IK191548K', 100, 19, 5.5, 15, 'Kraft', 21.201],
   ['IK191594K', 97.92, 19, 5.5, 15, 'Kraft', 20.83],
   ['IK191696K', 106.67, 19, 5.5, 16, 'Kraft', 22.955],
   ['IK192348K', 138, 19, 5.5, 23, 'Kraft', 29.391],
   ['IK192448K', 128, 19, 5.5, 24, 'Kraft', 27.237],
   ['IK301648K', 69.33, 30, 10, 16, 'Kraft', 26.64],
   ['IK302448K', 88,	30, 10, 24, 'Kraft', 29.883],
   ['IK381648K', 58.67,	38, 12, 16, 'Kraft', 24.61],
   ['IK382448K', 64, 38, 12, 24, 'Kraft', 30.28],
   ['IKHD151593K', 58.13, 15, 3.5, 15, 'Kraft', 22.38],
   ['IKHD211593K', 67.81, 21, 5.5, 15, 'Kraft', 25.779],
   ['IKHD212393K', 67.81, 21, 5.5, 23, 'Kraft', 39.529],
   ['IKHD381548K', 40, 38, 10.25, 15, 'Kraft', 25.811],
   ['IKHD382348K', 61.33, 38, 10.25, 23, 'Kraft', 39.583],
   ['IU111594K', 159.28, 11, 3, 15, 'Unfaced', 20.345],
   ['IU111696K', 170.67, 11, 3, 16, 'Unfaced', 22.138],
   ['IU112496K', 256, 11, 3, 24, 'Unfaced', 33.116],
   ['IU131593K', 116.25, 13, 3.5, 15, 'Unfaced', 19.539],
   ['IU131696K', 128, 13, 3.5, 16, 'Unfaced', 21.584],
   ['IU132496K', 176, 13, 3.5, 24, 'Unfaced', 29.631],
   ['IU191548K', 100, 19, 5.5, 15, 'Unfaced', 19.836],
   ['IU191648K', 106.67, 19, 5.5, 16, 'Unfaced', 21.224],
   ['IU191696K', 106.67, 19, 5.5, 16, 'Unfaced', 21.148],
   ['IU191948K', 114, 19, 5.5, 19, 'Unfaced', 22.706],
   ['IU192448K', 128, 19, 5.5, 24, 'Unfaced', 25.417],
   ['IU301648K', 69.33, 30, 10, 16, 'Unfaced', 22.419],
   ['IU301948K', 70.58, 30, 10, 19, 'Unfaced', 22.823],
   ['IU302448K', 88, 30, 10, 24, 'Unfaced', 28.457],
   ['IU381648K', 58.67, 38, 12, 16, 'Unfaced', 22.95],
   ['IU382448K', 64, 38, 12, 24, 'Unfaced', 24.955],
   ['IUHD151593K', 58.13, 15, 3.5, 15, 'Unfaced', 25.305],
   ['IUHD152393K', 89.13, 15, 3.5, 23, 'Unfaced', 29.196],
   ['IUHD211593K', 67.81, 21, 5.5, 15, 'Unfaced', 24.082],
   ['IUHD212393K', 103.98, 21, 5.5, 23, 'Unfaced', 37.93],
   ['IUHD301548K', 55, 30, 8.25, 15, 'Unfaced', 25.623],
   ['IUHD302348K', 84.33, 30, 8.25, 23, 'Unfaced', 33.775],
   ['IUHD381548K', 40, 38, 10.25, 15, 'Unfaced', 24.157],
   ['IUHD382348K', 61.33, 38, 10.25, 23, 'Unfaced', 36.908]
]

accessory.each do |name|
   Accessory.create(name: name)
end

insulation.each do |name, coverage, r_value, thickness, width, facing, price|
   InsulationType.create(
      name: name,
      coverage: coverage,
      r_value: r_value,
      thickness: thickness,
      width: width,
      facing: facing,
      price: price
   )
end

User.create(
   email: 'amelie@email.com',
   password: 'password'
)

# new_quote = User.first.quotes.build(
#    customer_name: Faker::Name.name,
#    street: Faker::Address.street_name,
#    city: Faker::Address.city,
#    zip_code: Faker::Address.zip_code,
#    state: Faker::Address.state_abbr,
#    applications_attributes: [
#       {
#          application_type: "Ceiling",
#          description: Faker::Lorem.sentence,
#          oc: 15,
#          framing: "Metal",
#          r_value: 19,
#          depth: 18,
#          length: 100,
#          width: 0,
#          height: 8,
#          vapor_barrier: "unfacing"
#       }
#    ]
# )

# new_quote.save