class DoctorsController < ApplicationController

  def index
    @doctors = Doctor.all
  end

  def new
    @doctor = Doctor.new
  end

  def create
    @doctor = Doctor.new(doctor_params)
    if @doctor.save
      redirect_to @doctor
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @doctor = Doctor.find(params[:id])
  end

  def edit
    @doctor = Doctor.find(params[:id])
  end

  def update
    @doctor = Doctor.find(params[:id])
    if @doctor.update(doctor_params)
      redirect_to @doctor
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @doctor = Doctor.find(params[:id])
    @doctor.destroy

    redirect_to doctors_path, status: :see_other, notice: "doctor was successfully destroyed."
  end

  def consultations
    @doctor =Doctor.find(params[:id])
    @consultations = @doctor.consultations
  end

  private
  def doctor_params
    params.require(:doctor).permit(:fullname, :cpf, :email, :specialty, :crm)
  end
end
