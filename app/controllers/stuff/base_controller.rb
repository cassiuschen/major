class Stuff::BaseController < ApplicationControlelr
  before_action :authenticate_user!
  before_action :require_stuff


  private
  def check_if_is_stuff
    if user_signed_in?
      raise CanCan::AccessDenied unless current_user.stuff?
    else
      raise CanCan::AccessDenied
    end
  end
end