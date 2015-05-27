class Stuff::DashboardController < Stuff::BaseController
  before_action :has_major_info?, only: :index
  def index
    
  end

  def set_university
  end

  def update_major
  end

  private
  def has_major_info?
    if current_user.has_major_info?
      puts 'dont redirect'
    else
      puts 'redirect!!'
      redirect_to stuff_set_major_path
    end
  end
end