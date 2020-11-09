class PatientsController < ApplicationController

  def destroy
    patient = Patient.find(params[:id])
    doctor = patient.doctors
    patient.destroy
    redirect_to "/doctors/doctor_id"
    flash[:notice] = "A Patient Has Been Removed"
  end
end
