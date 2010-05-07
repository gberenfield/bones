# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def is_editor
    return (current_user.editor || current_user.admin)
  end
  
  def is_admin
    return (current_user.admin)
  end
  
  def user_role
    if (current_user)
      # return (current_user.role)
    end
  end  
  
end
