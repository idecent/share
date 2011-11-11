class Admin::BaseController < ApplicationController
  before_filter :authenticate
  layout "admin"
  protected

  def authenticate
    authenticate_or_request_with_http_basic do |username, password|
      username == "foo" && password == "bar"
    end
  end
end