
class ContractsController < ApplicationController
  def index = ( @contracts = Contract.all )

  def show
    @contract = Contract.find_by(id: params[:id])
  end
end

