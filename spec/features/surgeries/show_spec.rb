require 'rails_helper'

RSpec.describe 'Surgery Show Page' do 
  before :each do 
    @doc1 = Doctor.create!(name: "James Holden", years_practiced: 7, university: "Wyoming" )
    @doc2 = Doctor.create!(name: "Prax Meng", years_practiced: 23, university: "Ganymede" )

    @surg1 = Surgery.create!(title: "Backeotomy", day_of_the_week: "Monday", operating_room_number: 13)

    @ds1 = DoctorSurgery.create!(doctor_id: @doc1.id, surgery_id: @surg1.id)
    @ds2 = DoctorSurgery.create!(doctor_id: @doc2.id, surgery_id: @surg1.id)
    

    visit surgery_path(@surg1)
  end

  it "lists the surgery attributes" do 
    within("#surgery-info") do 
      expect(page).to have_content("Title: #{@surg1.title}")
      expect(page).to have_content("Day of Week: #{@surg1.day_of_the_week}")
      expect(page).to have_content("Room Number: #{@surg1.operating_room_number}")
    end
  end

  it "lists al the doctors names and years or experience" do 
    within("#all-doctors") do 
      expect(page).to have_content("Name: #{@doc1.name}")
      expect(page).to have_content("Years Experience: #{@doc1.years_practiced}")

      expect(page).to have_content("Name: #{@doc2.name}")
      expect(page).to have_content("Years Experience: #{@doc2.years_practiced}")
    end
  end

  it "shows the doctors with most and least experience in different sections" do 
    within("#most-experienced") do 
      expect(page).to have_content("Name: #{@doc2.name}")
      expect(page).to have_content("Years Experience: #{@doc2.years_practiced}")
    end

    within("#least-experienced") do 
      expect(page).to have_content("Name: #{@doc1.name}")
      expect(page).to have_content("Years Experience: #{@doc1.years_practiced}")
    end
  end
end