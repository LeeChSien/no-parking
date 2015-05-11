class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :set_default_ng_app

  protected

  def set_default_ng_app
    @ng_app = 'defaultApp'
  end

  def set_ng_app(ng_app)
    @ng_app = ng_app
  end
end
