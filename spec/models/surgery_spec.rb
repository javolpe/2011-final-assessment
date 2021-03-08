require 'rails_helper'

RSpec.describe Surgery, type: :model do
  describe "relationships" do 
    it { should have_many :doctor_surgeries }
    it { should have_many(:doctors).through(:doctor_surgeries) }
  end

  describe "instance methods" do 
    it "finds the most experienced doctor" do
      @doc1 = Doctor.create!(name: "James Holden", years_practiced: 7, university: "Wyoming" )
      @doc2 = Doctor.create!(name: "Prax Meng", years_practiced: 23, university: "Ganymede" )

      @surg1 = Surgery.create!(title: "Backeotomy", day_of_the_week: "Monday", operating_room_number: 13)

      @ds1 = DoctorSurgery.create!(doctor_id: @doc1.id, surgery_id: @surg1.id)
      @ds2 = DoctorSurgery.create!(doctor_id: @doc2.id, surgery_id: @surg1.id)

      most_exp = @surg1.most_experienced_doc

    expect(most_exp.name).to eq(@doc2.name)
    end

    it "finds the least experienced doctor" do
      @doc1 = Doctor.create!(name: "James Holden", years_practiced: 7, university: "Wyoming" )
      @doc2 = Doctor.create!(name: "Prax Meng", years_practiced: 23, university: "Ganymede" )

      @surg1 = Surgery.create!(title: "Backeotomy", day_of_the_week: "Monday", operating_room_number: 13)

      @ds1 = DoctorSurgery.create!(doctor_id: @doc1.id, surgery_id: @surg1.id)
      @ds2 = DoctorSurgery.create!(doctor_id: @doc2.id, surgery_id: @surg1.id)

      least_exp = @surg1.least_experienced_doc

      expect(least_exp.name).to eq(@doc1.name)
    end
  end
end
