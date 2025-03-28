
class ContractsController < ApplicationController

  def index
    @contracts = Contract.all
  end

  def new
    @contract = Contract.new
  end

  def create
    @contract = Contract.new(params.expect(contract: [:name, :date, :content]))

    if @contract.save
      respond_to do |foramt|
        format.html do
          redirect_to contracts_path
        end
      end
    else
      render :new
    end
  end
end

