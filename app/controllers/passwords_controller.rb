class PasswordsController < ApplicationController

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.authenticate(params[:user][:now_password])
      if @user.update_attributes(user_params)
        flash[:success] = 'パスワードの更新に成功しました。'
        redirect_to @user
      else
        render 'edit'
      end
    else
      debugger
      @user.errors.add(:password, '現在のパスワードが違います。')
      render 'edit'
    end
  end

  private

    def user_params
      params.require(:user).permit(:password, :password_confirmation)
    end
end
