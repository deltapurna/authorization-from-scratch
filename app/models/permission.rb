class Permission < Struct.new(:user)
  def allow?(controller, action)
    return true if controller == 'devise/sessions'
    return true if controller == 'devise/registrations' &&
      action.in?(%w[new create])
    return true if controller == 'topics' &&
      action.in?(%w[index show])
    if user
      return true if controller == 'devise/registrations' &&
        action.in?(%[edit update])
      return true if controller == 'topics' && action != 'destroy'
      return true if user.admin?
    end
    false
  end
end
