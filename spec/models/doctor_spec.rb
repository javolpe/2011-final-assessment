require 'rails_helper'

RSpec.describe Doctor, type: :model do
  describe "relationships" do 
    it { should have_many :doctor_surgeries }
    it { should have_many(:surgeries).through(:doctor_surgeries) }
  end
   
  describe "Class Methods" do 
    it "displays the doctors in order of most practiced to least practiced" do 
      @doc1 = Doctor.create!(name: "James Holden", years_practiced: 7, university: "Wyoming" )
      @doc2 = Doctor.create!(name: "Prax Meng", years_practiced: 23, university: "Ganymede" )
      @doc3 = Doctor.create!(name: "Elvi Okoye", years_practiced: 16, university: "Ilus" )

      @doctors = Doctor.most_to_least_practiced

      expect(@doctors.first.id).to eq(@doc2.id)
      expect(@doctors.second.id).to eq(@doc3.id)
      expect(@doctors.third.id).to eq(@doc1.id)
    end
  end
end
