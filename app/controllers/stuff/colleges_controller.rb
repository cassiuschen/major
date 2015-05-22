class Stuff::CollegesController < Stuff::BaseController
  before_action :set_college, only: :show
  def show
    render json: (@college.majors || [])
  end

  def create
    @college = College.create(college_params)
    @feed = FeedBack.create(sender: 'system', content: "用户创建学院：#{@college.name}")
  end

  private
  def set_college
    @college = College.find(params[:id])
  end

  def college_params
    params.require(:college).permit(:name, :short_name)
  end
end