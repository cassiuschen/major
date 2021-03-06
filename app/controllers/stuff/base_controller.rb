class Stuff::BaseController < ApplicationController
  before_action :authenticate_user!
  before_action :require_stuff

  layout 'layouts/dashboard'


  private
  def check_if_is_stuff
    if user_signed_in?
      raise CanCan::AccessDenied unless (current_user.stuff? || current_user.editor? || current_user.admin?)
    else
      raise CanCan::AccessDenied
    end
  end
end