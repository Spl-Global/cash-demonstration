# frozen_string_literal: true

# :Application Controller:
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper ApplicationHelper

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, alert: exception.message
  end

  def after_sign_in_path_for(resource)
    stored_location_for(resource) ||
      if resource.is_a?(User) and resource.has_role? :teacher
        profile_path
      elsif resource.is_a?(User) and resource.has_role? :student
        companies_path
      else
        super
      end
  end
end
