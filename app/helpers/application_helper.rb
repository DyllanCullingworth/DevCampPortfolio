module ApplicationHelper

  def login_helper
    unless current_user.is_a?(GuestUser)
      link_to("Logout", destroy_user_session_path, method: :delete)
    else
      (link_to("Login", new_user_session_path)) +
      "<br>".html_safe +
      (link_to("Sign up", new_user_registration_path))
    end
  end

  def source_helper
    if session[:source]
      greeting = "Thank you for visiting me from #{ session[:source]}"
      content_tag(:p, greeting, class: "source-greeting" )
    end
  end

  def copyright_generator
    @copyright = DyllanCullingworthViewTool::Renderer.copyright 'Dyllan Cullingworth', 'All rights reserved'
  end

end
