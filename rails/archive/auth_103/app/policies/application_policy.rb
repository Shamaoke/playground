
class ApplicationPolicy < ActionPolicy::Base
  authorize :user
  # authorize :user, allow_nil: true
end

