class Stuff::UsersController < Stuff::BaseController
  before_action :set_user
  def university
    @user.university_id = params[:university_id]
    @user.save
    @uni = @user.university
  end

  def college
    @user.college_id = params[:college_id]
    @user.save
  end

  def major
    @user.major_id = params[:major_id]
    if @user.validate_college_info!
      @user.save
      redirect_to stuff_dashboard_path
    else
      redirect_to stuff_set_major_path, flash: {error: '信息出错，请重新填写！'}
    end
  end

  def update

  end

  def edit
  end

  private
  def user_params
    params.require(:user).permit(:university_id, :college_id, :major_id)
  end

  def set_user
    @user = User.where(id: params[:id]).first
    unless current_user.admin?
      raise CanCan::AccessDenied unless @user == current_user
    end
  end
end