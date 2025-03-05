
class ApplicationPolicy < ActionPolicy::Base

  ##
  ## Remove an authorization subject which was previously added. The following
  ## methods can be used for the purpose.
  ##
  ## authorization_targets.delete(:user)
  ## authorize :user, optional: true
  ##
  ## In the case of the default authorization subject, — `user`, this must be done
  ## when disabling the default authorization subject assign method, by setting
  ## `config.action_policy.controller_authorize_current_user = false` in the
  ## `config/application.rb` file, to prevent the `ActionPolicy::AuthorizationContextMissing`
  ## exception from rising.
  ##

  ##
  ## Specify, whom we authorize. This is officially called the “authorization context”.
  ## I prefer to call it “authorization subject”. The authorization subject will be
  ## used in policy classes. It will be available through the `empolyee` accessor method.
  ##
  authorize :employee
end

