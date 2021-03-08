class DoctorSurgeriesController < ApplicationController 
  def create 
    doc = Doctor.find_by_name(params[:name])
    DoctorSurgery.create(doctor_id: doc.id, surgery_id: params[:surgery_id])
    redirect_to surgery_path(params[:surgery_id])
  end
end