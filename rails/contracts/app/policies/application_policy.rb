
class ApplicationPolicy < ActionPolicy::Base

  ##
  ## `ActionPolicy::AuthorizationContextMissing`
  ##
  ## authorization_targets.delete(:user)
  ## authorize :user, optional: true
  ##

  ##
  ## Specify, whom we authorize. This is officially called the “authorization context”.
  ## I prefer to call it “authorization subject”. The authorization subject will be
  ## used in policy classes. It will be available through the `empolyee` accessor method.
  ##
  authorize :employee
end

