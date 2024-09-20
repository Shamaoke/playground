class SpecificationsController < ApplicationController
  before_action :set_specification, only: %i[ show edit update destroy ]

  # GET /specifications or /specifications.json
  def index
    @specifications = Specification.all
  end

  # GET /specifications/1 or /specifications/1.json
  def show
  end

  # GET /specifications/new
  def new
    @specification = Specification.new
  end

  # GET /specifications/1/edit
  def edit
  end

  # POST /specifications or /specifications.json
  def create
    @specification = Specification.new(specification_params)

    respond_to do |format|
      if @specification.save
        format.html { redirect_to @specification, notice: "Specification was successfully created." }
        format.json { render :show, status: :created, location: @specification }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @specification.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /specifications/1 or /specifications/1.json
  def update
    respond_to do |format|
      if @specification.update(specification_params)
        format.html { redirect_to @specification, notice: "Specification was successfully updated." }
        format.json { render :show, status: :ok, location: @specification }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @specification.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /specifications/1 or /specifications/1.json
  def destroy
    @specification.destroy!

    respond_to do |format|
      format.html { redirect_to specifications_path, status: :see_other, notice: "Specification was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_specification
      @specification = Specification.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def specification_params
      params.require(:specification).permit(:number, :date, :description, :contract_id)
    end
end
