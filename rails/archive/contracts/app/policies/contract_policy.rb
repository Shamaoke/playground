
class ContractPolicy < ApplicationPolicy

  # def index?
  #   employee.capable? :show_contracts
  # end

  def index? = employee.capable? :show_contracts

  def show?
    ##
    ## Specify the properties an authorization subject should have in order
    ## to be authorized for performing the specified action `show` on the specified
    ## resource `Contract`. The authorization subject is assigned in the controller
    ## for the resource: `ContractsController`, through the `authorize` method.`
    ##
    employee.capable? :show_contracts
  end
end

