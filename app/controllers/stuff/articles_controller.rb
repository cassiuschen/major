class Stuff::ArticlesController < Stuff::BaseController
  before_action :set_article, except: [:new, :create]
  def show
  end

  def edit
    render layout: 'layouts/new_article'
  end

  def new
    render layout: 'layouts/new_article'
  end

  def create
    @article = current_user.articles.build article_params
    if @article.save
      redirect_to stuff_dashboard_path, flash: {success: '文章发布成功！'}
    else
      render :new, flash: {error: '文章发布失败！'}
    end
  end

  def update
    @article.update article_params
    if @article.save
      redirect_to stuff_dashboard_path, flash: {success: '文章更新成功！'}
    else
      render :edit, flash: {error: '文章更新失败！'}
    end
  end

  def destroy
    @article.delete
    redirect_to stuff_dashboard_path, flash: {success: '文章删除成功！'}
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