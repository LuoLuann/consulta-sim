class PatientsController < ApplicationController

  def index
    @patients = Patient.all
  end


  def show
    @patient = Patient.find(params[:id])
  end

  def new
    @patient = Patient.new
    @address = @patient.build_address
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

  def edit
    @patient = Patient.find(params[:id])
  end

  def update
    @patient = Patient.find(params[:id])
    if @patient.update(patient_params)
      redirect_to @patient
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def edit_address
    @patient = Patient.find(params[:id])
    @address = @patient.address
  end

  def update_address
    @patient = Patient.find(params[:id])
    @address = @patient.address

    if @address.update(address_params)
      redirect_to @patient, notice: "Endereço atualizado com sucesso."
    else
      render :edit_address, status: :unprocessable_entity
    end
  end

  # def destroy
  #   @patient = Patient.find(params[:id])
  #   @patient.destroy
  #   redirect_to patient_path, status: :see_other
  # end

  private

  def patient_params
    params.require(:patient).permit(:fullname, :birthdate, :cpf, :email, address_attributes: [:cep, :city, :neighborhood, :street, :next])
  end

  def address_params
    params.require(:address).permit(:cep, :city, :neighborhood, :street, :next)
  end
end
