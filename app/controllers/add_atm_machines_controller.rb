class AddAtmMachinesController < ApplicationController
  before_action :set_add_atm_machine, only: [:show, :edit, :update, :destroy]

  # GET /add_atm_machines
  # GET /add_atm_machines.json
  def index
    @add_atm_machines = AddAtmMachine.all
  end

  # GET /add_atm_machines/1
  # GET /add_atm_machines/1.json
  def show
  end

  # GET /add_atm_machines/new
  def new
    @add_atm_machine = AddAtmMachine.new
  end

  # GET /add_atm_machines/1/edit
  def edit
  end

  # POST /add_atm_machines
  # POST /add_atm_machines.json
  def create
    @add_atm_machine = AddAtmMachine.new(add_atm_machine_params)

    respond_to do |format|
      if @add_atm_machine.save
        format.html { redirect_to @add_atm_machine, notice: 'Add atm machine was successfully created.' }
        format.json { render :show, status: :created, location: @add_atm_machine }
      else
        format.html { render :new }
        format.json { render json: @add_atm_machine.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /add_atm_machines/1
  # PATCH/PUT /add_atm_machines/1.json
  def update
    respond_to do |format|
      if @add_atm_machine.update(add_atm_machine_params)
        format.html { redirect_to @add_atm_machine, notice: 'Add atm machine was successfully updated.' }
        format.json { render :show, status: :ok, location: @add_atm_machine }
      else
        format.html { render :edit }
        format.json { render json: @add_atm_machine.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /add_atm_machines/1
  # DELETE /add_atm_machines/1.json
  def destroy
    @add_atm_machine.destroy
    respond_to do |format|
      format.html { redirect_to add_atm_machines_url, notice: 'Add atm machine was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_add_atm_machine
      @add_atm_machine = AddAtmMachine.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def add_atm_machine_params
      params.require(:add_atm_machine).permit(:address, :latitude, :longitude, :name, :street, :city)
    end
end
