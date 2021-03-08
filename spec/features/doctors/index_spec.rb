require 'rails_helper'

RSpec.describe 'Doctor Index Page' do 
  before :each do 
    @doc1 = Doctor.create!(name: "James Holden", years_practiced: 7, university: "Wyoming" )
    @doc2 = Doctor.create!(name: "Prax Meng", years_practiced: 23, university: "Ganymede" )
    @doc3 = Doctor.create!(name: "Elvi Okoye", years_practiced: 16, university: "Ilus" )

    visit doctors_path
  end

  it "shows all the doctors and their attributes" do 
    within("#doctor-#{@doc1.id}") do 
      expect(page).to have_content("Name: #{@doc1.name}")
      expect(page).to have_content("Years Practiced: #{@doc1.years_practiced}")
      expect(page).to have_content("University: #{@doc1.university}")
    end

    within("#doctor-#{@doc2.id}") do 
      expect(page).to have_content("Name: #{@doc2.name}")
      expect(page).to have_content("Years Practiced: #{@doc2.years_practiced}")
      expect(page).to have_content("University: #{@doc2.university}")
    end

    within("#doctor-#{@doc3.id}") do 
      expect(page).to have_content("Name: #{@doc3.name}")
      expect(page).to have_content("Years Practiced: #{@doc3.years_practiced}")
      expect(page).to have_content("University: #{@doc3.university}")
    end
    # order tested in doctor_spec.rb
  end
end