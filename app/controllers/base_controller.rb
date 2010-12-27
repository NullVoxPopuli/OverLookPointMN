class BaseController < ApplicationController

  before_filter :authenticate

  
  def authenticate
    authenticate_or_request_with_http_basic do |username, password|
      username == "admin" && password == "adm!np4$$"
    end
  end
end