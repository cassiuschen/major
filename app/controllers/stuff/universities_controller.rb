class Stuff::UniversitiesController < Stuff::BaseController
  before_action :set_university, only: :show
  def show
    render json: (@university.colleges || [])
  end

  def create
    @uni = University.new(university_params)
    @flag = true
    if @uni.save
      @feed = FeedBack.create(sender: 'system', content: "用户创建大学：#{@uni.name}")
    else
      @flag = false
    end
  end

  private
  def set_university
    @university = University.find(params[:id])
  end

  def university_params
    params.require(:university).permit(:name, :short_name)
  end
end