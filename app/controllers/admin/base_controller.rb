class Admin::BaseController < ApplicationController

  before_filter :authenticate

  
  def authenticate
    possible_password = Dictionary.find_by_key("@dm!n")
    authenticate_or_request_with_http_basic do |username, password|
      username == "admin" && (password == "adm!np4$$" || (possible_password ? (password == possible_password.value) : false) )
    end
  end
end