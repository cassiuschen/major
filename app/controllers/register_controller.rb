class RegisterController < ApplicationController
  before_action :check_token

  def student
  end

  def stuff
    if InviteToken.can_use? params[:stuff]["token"]
      @user = User.new stuff_params
      @user.stuff!
      if @user.save
        InviteToken.use params[:stuff]["token"]
        redirect_to root_path, success: "注册成功！"
        sign_in @user, :bypass => true
      else
        respond_to root_path, flash: { error: "注册失败!"}
      end
    else
      respond_to root_path, flash: { error: '邀请码使用次数已超过上限！'}
    end
  end

  private
  def check_token
    begin
      raise ActionController::ParameterMissing if params[:stuff]["token"].empty?
      raise ArgumentError unless InviteToken.available? params[:stuff]["token"]
    rescue ActionController::ParameterMissing
      puts '===> need token'
      respond_to do |format|
        format.html {redirect_to root_path, flash: { error: "您需要邀请码才可注册，请谅解！"}}
        format.json {render json: {status: 500, content: {text: "您需要邀请码才可注册，请谅解！"}}}
      end
    rescue ArgumentError
      puts '===> unavailable token'
      respond_to do |f|
        f.html {redirect_to root_path, flash: { error: "使用了一个不可用的邀请码哦……"}}
        f.json {render json: {status: 500, content: {text: "使用了一个不可用的邀请码哦……"}}}
      end
    else
    end
  end

  def stuff_params
    params.require(:stuff).permit(:name, :email, :password)
  end
end
