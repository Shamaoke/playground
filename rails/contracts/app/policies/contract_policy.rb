
class ContractPolicy < ApplicationPolicy

  def show?
    # p method(:user).source_location
    # p user.class
    # p user
    # user.capabilities.map { it.name.to_sym }.any? :show_contracts
    # p employee.class
    # p employee

    ##
    ## Specify the properties an authorization subject should have in order
    ## to be authorized for performing the specified action `show` on the specified
    ## resource `Contract`. The authorization subject is assigned in the controller
    ## for the resource: `ContractsController`, through the `authorize` method.`
    ##
    employee.capabilities.map { it.name.to_sym }.any? :show_contracts
  end

end

