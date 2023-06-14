class PatientsController < ApplicationController

  def index
    @patients = Patient.all
  end


  def show
    @patient = Patient.find(params[:id])
  end

  def new
    @patient = Patient.new
  end

  def create
    @patient = Patient.new(patient_params)
    #this is the same that:
    #params[:article][:title] and params[:article][:body].
    if @patient.save
      redirect_to @patient
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
    def patient_params
      params.require(:patient).permit(:fullname, :data_of_birth, :cpf, :email, address_attributes: [:cep, :city, :neighborhood, :street, :complement])
    end

end
