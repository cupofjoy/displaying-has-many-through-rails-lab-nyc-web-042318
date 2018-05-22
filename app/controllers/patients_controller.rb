class PatientsController < ApplicationController
  before_action :get_patient, only: [:edit, :destroy, :show]

  def index
    @patients = Patient.all
  end

  def new
    @patient = Patient.new
  end

  def create
    @patient = Patient.new(patient_params)
    if @patient.save
      redirect_to patient_path(@patient)
    else
      redirect_to new_patient_path
    end
  end

  def show
  end

  def update
    @patient = Patient.update(patient_params)

    if @patient.save
      redirect_to patient_path(@patient)
    else
      redirect_to edit_patient(@patient)
    end
  end

  def edit
  end

  def destroy
    @patient.destroy
    redirect_to patients_path
  end

  private
  def get_patient
    @patient = Patient.find(params[:id])
  end

  def patient_params
    params.require(:patient).permit(:name, :age)
  end
end
