class AppointmentsController < ApplicationController
  before_action :get_appointment, only: [:edit, :destroy, :show]

  def new
    @appointment = Appointment.new
  end

  def create
    @appointment = Appointment.new(appointment_params)
    if @appointment.save
      redirect_to appointment_path(@appointment)
    else
      redirect_to new_appointment_path
    end
  end

  def show
  end

  def update
    @appointment = Appointment.update(appointment_params)

    if @appointment.save
      redirect_to appointment_path(@appointment)
    else
      redirect_to edit_appointment(@appointment)
    end
  end

  def edit
  end

  def destroy
    @appointment.destroy
    redirect_to appointment_path
  end

  private
  def get_appointment
    @appointment = Appointment.find(params[:id])
  end

  def appointment_params
    params.require(:appointment).permit(:appointment_datetime, :doctor, :patient)
  end
end
