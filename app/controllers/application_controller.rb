class ApplicationController < ActionController::Base

  def after_sign_in_path_for(resource_or_scope)
    return root_path # CHANGE HERE FOR REDIRECT
  end
end
