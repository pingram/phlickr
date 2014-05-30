class StaticPagesController < ApplicationController
  before_action :require_login!

  # TODO: this is a little hacky - find a better way
  def root
    if session[:has_toured]
      render :root
    else
      session[:has_toured] = true
      render :root_with_tour
    end
  end
end