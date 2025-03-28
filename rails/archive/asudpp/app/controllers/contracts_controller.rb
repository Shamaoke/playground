class ContractsController < ApplicationController
  # before_action :set_contract, only: %i[ show edit update destroy ]
  before_action :set_contract, only: %i[ edit update destroy ]

  # GET /contracts or /contracts.json
  def index
    @contracts = Contract.all
  end

  # GET /contracts/1 or /contracts/1.json
  def show
    @contract = Contract.find(params[:id])
    if can? :read, @contract
      render :show
    else
      redirect_to contracts_path, notice: 'Вы не можете просматривать договоры'
    end
  end

  # GET /contracts/new
  def new
    @contract = Contract.new
  end

  # GET /contracts/1/edit
  def edit
  end

  # POST /contracts or /contracts.json
  def create
    @contract = Contract.new(contract_params)

    respond_to do |format|
      if @contract.save
        format.html { redirect_to @contract, notice: t('contract.notice.create') }
        format.json { render :show, status: :created, location: @contract }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @contract.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /contracts/1 or /contracts/1.json
  def update
    if can? :update, @contract
      @contract.update(contract_params)
      redirect_to @contract, notice: t('contract.notice.update')
    else
      redirect_to @contract, notice: 'Вы не можете редактировать договоры'
    end

    # respond_to do |format|
    #   if @contract.update(contract_params)
    #     format.html { redirect_to @contract, notice: t('contract.notice.update') }
    #     format.json { render :show, status: :ok, location: @contract }
    #   else
    #     format.html { render :edit, status: :unprocessable_entity }
    #     format.json { render json: @contract.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # DELETE /contracts/1 or /contracts/1.json
  def destroy
    if can? :destroy, @contract
      @contract.destroy!
      redirect_to contracts_path, notice: t('contract.notice.destroy')
    else
      redirect_to contracts_path, notice: 'Вы не можете договоры'
    end

    # @contract.destroy!

    # respond_to do |format|
    #   format.html { redirect_to contracts_path, status: :see_other, notice: t('contract.notice.destroy') }
    #   format.json { head :no_content }
    # end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contract
      @contract = Contract.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def contract_params
      params.require(:contract).permit(:number, :date, :description)
    end
end
