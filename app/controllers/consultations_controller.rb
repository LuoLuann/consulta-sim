class ConsultationsController < ApplicationController
  def index
  end

  def new
    @patient = Patient.find(params[:patient_id])
    @consultation = @patient.consultations.build

  end

  def create
    @patient = Patient.find(params[:patient_id])
    @consultation = @patient.consultations.build(consultation_params)
    puts @patient # Exibe os parâmetros no console
    if @consultation.save
      redirect_to @patient
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
  def consultation_params
    params.require(:consultation).permit(:patient_id, :doctor_id, :date, :time)
  end
end


  # def edit
  # end

  # def update
  # end

  # def show
  # end
