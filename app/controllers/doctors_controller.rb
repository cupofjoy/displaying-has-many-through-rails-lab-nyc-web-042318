class DoctorsController < ApplicationController
  before_action :get_doctor, only: [:edit, :destroy, :show]

  def index
    @doctors = Doctor.all
  end

  def new
    @doctor = Doctor.new
  end

  def create
    @doctor = Doctor.new(doctor_params)
    if @doctor.save
      redirect_to doctor_path(@doctor)
    else
      redirect_to new_doctor_path
    end
  end

  def show
  end

  def update
    @doctor = Doctor.update(doctor_params)

    if @doctor.save
      redirect_to doctor_path(@doctor)
    else
      redirect_to edit_doctor(@doctor)
    end
  end

  def edit
  end

  def destroy
    @doctor.destroy
    redirect_to doctors_path
  end

  private
  def get_doctor
    @doctor = Doctor.find(params[:id])
  end

  def doctor_params
    params.require(:doctor).permit(:name, :department)
  end
end
