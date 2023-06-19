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
    if @consultation.save
      redirect_to @patient
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @patient = Patient.find(params[:patient_id])
    @consultations = @patient.consultations
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

