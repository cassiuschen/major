class Stuff::MajorsController < Stuff::BaseController
  before_action :set_major, only: :show
  def show
    render json: (@major.majors || [])
  end

  def create
    @major = Major.create(major_params)
    @flag = true
    if @major.save
      @feed = FeedBack.create(sender: 'system', content: "用户创建专业：#{@major.name}")
    else
      @flag = false
    end
  end

  private
  def set_major
    @major = Major.find(params[:id])
  end

  def major_params
    params.require(:major).permit(:name, :desc, :college_id, :discipline_id)
  end
end