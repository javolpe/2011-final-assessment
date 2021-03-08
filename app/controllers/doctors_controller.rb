class DoctorsController < ApplicationController
  def index
    @doctors = Doctor.most_to_least_practiced
  end
end