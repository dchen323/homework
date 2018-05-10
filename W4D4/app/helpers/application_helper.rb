module ApplicationHelper
  def auth_token
    auth ="<input type=\"hidden\"name=\"authenticity_token\"value=\"#{h(form_authenticity_token)}\">"
    auth.html_safe
  end
end
