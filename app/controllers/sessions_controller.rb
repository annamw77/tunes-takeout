class SessionsController < ApplicationController
  def new
  end

  def create
     auth_hash = request.env['omniauth.auth']
     raise
  end
end
