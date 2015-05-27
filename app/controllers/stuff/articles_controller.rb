class Stuff::ArticlesController < Stuff::BaseController
  before_action :set_article, except: [:new, :create]
  def show
  end

  def edit
  end

  def new
    render layout: 'layouts/new_article'
  end

  def create
  end

  def update
  end

  def destroy
  end

  private
  def set_article
    @article = Article.where(id: params[:id]).first
    raise ArgumentError unless @article
  end

  def article_params
    params.require(:article).permit(:user_id, :content, :title)
  end
end