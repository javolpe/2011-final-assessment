class Surgery < ApplicationRecord
  has_many :doctor_surgeries
  has_many :doctors, through: :doctor_surgeries

  def most_experienced_doc
    doctors.order(years_practiced: :desc).limit(1).first
  end

  def least_experienced_doc
    doctors.order("years_practiced").limit(1).first
  end
end
