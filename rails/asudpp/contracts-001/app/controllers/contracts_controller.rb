
class ContractsController < ApplicationController

  def index
    @contracts = Contract.all
  end

  def show
    @contract = Contract.find_by(id: params[:id])
  end

  def new
    @contract = Contract.new
  end

  def create
    @contract = Contract.new(params.expect(contract: [:name, :date, :content]))

    if @contract.save
      respond_to do |format|
        format.html do
          redirect_to contracts_path
        end
      end
    else
      render :new
    end
  end

  def edit
    @contract = Contract.find_by(id: params[:id])
  end

  def update
    @contract = Contract.find_by(id: params[:id])

    if @contract.update(params.expect(contract: [:name, :date, :content]))
      respond_to do |format|
        format.html do
          redirect_to contracts_path
        end
      end
    else
      render :edit
    end
  end

  def destroy
    @contract = Contract.find_by(id: params[:id])
    @contract.destroy
    redirect_to contracts_path
  end
end

