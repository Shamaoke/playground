
class ContractsController < ApplicationController
  ##
  ## The `authorize!` method performs the actual authorization. The method will
  ## assign the authorization subject by calling the method which was set for
  ## its assignment (`authorization_subject` in our case).
  ##
  ## By default the method will always use the `user` authorization subject with
  ## the `current_user` assignment method along with those which was manually set.
  ## This is set in `action_policy-M.N.P/lib/action_policy/railtie.rb` file of
  ## the Action Policy gem.
  ##
  ## The aforementioned behaviour can be cancelled by setting the
  ## `config.action_policy.controller_authorize_current_user = false` option
  ## in the `config/application.rb` file and performing
  ## `ActionPolicy::Base.authorization_targets.delete(:user)` for deleting the
  ## default authorization subject.
  ##
  ## As the first argument for the `authorize!` method either a model class or
  ## a model instance should be provided in order to infer the corresponding
  ## policy class from them. If none is provided, the model class is infered
  ## from the controller class (by using `controller_name.classify.save_constantize`)
  ## and from the inferred model the corresponding policy class is inferred.
  ##
  ## A policy action should be provided as `to` named argument of the `authorize!`
  ## method. If it's not provided, it's inferred from a controller action
  ## (by using `action_name`).
  ##
  before_action :authorize!, only: [:index, :show]
  ##
  ## Details:
  ##
  ## [Module: ActionPolicy::Controller — Documentation for action_policy (0.7.3)](https://rubydoc.info/gems/action_policy/ActionPolicy/Controller#authorize!-instance_method)
  ##

  ##
  ## Specify what method will be used to assign the authorization subject.
  ## It can be expressed as `assign :employee, as: authorization_subject`.
  ## In this case, the `authorization_subject` method can be read as “Set
  ## the authorization subject”. `employee` now is what this method returns.
  ## Typically it's the model object. In our case this is an instance of `User`.
  ##
  ## Note, that when calling the `authorize` method without the `through` option
  ## the method with the same name as the authorization subject will be used,
  ## e. g. in the case of `authorize :employee` the `employee` method will
  ## be called to set the authorization context (i. e. assign the authorization
  ## subject).
  ##
  ## The specified method will be called by the `authorize!` method in the
  ## controller's action. This will result in calling the corresponding policy
  ## method. In the case of the controller's `show` method the `show?` policy's
  ## method will be called from the `ContractPolicy` class.
  ##
  authorize :employee, through: :authorization_subject
  ## authorize :employee
  ## authorize :user, through: :authorization_subject

  def index
    @contracts = Contract.all
  end

  def show
    @contract = Contract.find_by_id(params[:id])
  end
end

