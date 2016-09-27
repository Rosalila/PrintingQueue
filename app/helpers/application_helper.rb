module ApplicationHelper
  def current_user
    return User.find_by_id(session["id"])
  end
end
