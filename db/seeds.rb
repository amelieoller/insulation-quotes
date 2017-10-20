# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

insulation = [
   ['IU161548A', 120, 16, 5, 16, 'unfaced', 17],
   ['IU191548B', 100, 19, 5.5, 14, 'Kraft', 17.5],
   ['IU241548C', 80, 24, 5.5, 15, 'Membrain', 18],
   ['IU161548D', 90, 16, 6, 19, 'none', 18.5],
   ['IU191548E', 120, 19, 5.5, 18, 'Visqueen', 19],
   ['IU241548F', 130, 24, 6.5, 17, 'unfaced', 19.5],
   ['IU191548G', 120, 19, 5.5, 16, 'Kraft', 20],
   ['IU161548H', 100, 16, 7.5, 15, 'Membrain', 20.5],
   ['IU241548I', 120, 24, 5.5, 24, 'none', 21],
   ['IU161548J', 110, 16, 7, 21, 'unfaced', 21.5],
   ['IU191548K', 80, 19, 5.5, 22, 'Kraft', 22],
   ['IU241548L', 120, 24, 6, 23, 'Membrain', 22.5],
   ['IU191548M', 70, 19, 5.5, 20, 'none', 23]   
]

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