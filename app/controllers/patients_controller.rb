class PatientsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_patient, only: [ :show, :edit, :update, :destroy ]
  load_and_authorize_resource

  def index
    @patients = Patient.all

    if params[:query].present?
      query = "%#{params[:query].downcase}%"
      @patients = @patients.where("LOWER(full_name) LIKE :query OR LOWER(diagnosis) LIKE :query OR LOWER(city) LIKE :query", query: query)
    end

    @patients = @patients.recent.page(params[:page]).per(10)

    @patient_chart_data = Patient.group_by_day(:created_at).count
  end


  def new
    @patient = Patient.new
  end

  def create
    @patient = Patient.new(patient_params)
    if @patient.save
      redirect_to patients_path, notice: "Patient successfully created."
    else
      render :new
    end
  end

  def show
  end

  def edit
    if cannot?(:update, @patient)
      redirect_to patients_path, alert: "You do not have permission to edit this patient."
    end
  end

  def update
    if @patient.update(patient_params)
      redirect_to patients_path, notice: "Patient successfully updated."
    else
      render :edit
    end
  end

  def destroy
    if cannot?(:destroy, @patient)
      redirect_to patients_path, alert: "You do not have permission to delete this patient."
    else
      @patient.destroy
      redirect_to patients_path, notice: "Patient successfully deleted."
    end
  end

  private

  def set_patient
    @patient = Patient.find_by(id: params[:id])
  end

  def patient_params
    params.require(:patient).permit(:full_name, :age, :diagnosis, :city, :address)
  end
end
