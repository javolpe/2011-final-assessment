# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

doc1 = Doctor.create!(name: "James Holden", years_practiced: 7, university: "Wyoming" )
doc2 = Doctor.create!(name: "Prax Meng", years_practiced: 23, university: "Ganymede" )
doc3 = Doctor.create!(name: "Elvi Okoye", years_practiced: 16, university: "Ilus" )

surg1 = Surgery.create!(title: "Backeotomy", day_of_the_week: "Monday", operating_room_number: 13)

ds1 = DoctorSurgery.create!(doctor_id: doc1.id, surgery_id: surg1.id)
ds2 = DoctorSurgery.create!(doctor_id: doc2.id, surgery_id: surg1.id)
    