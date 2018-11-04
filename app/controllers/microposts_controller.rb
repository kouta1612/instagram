class MicropostsController < ApplicationController

  def show
    @micoposts = current_user.microposts
  end

  def new
    @micropost = Micropost.new
  end

  def create
    @micropost = current_user.microposts.build(micropost_params)
    if @micropost.save
      flash[:success] = 'アップロードに成功しました。'
      redirect_to micropost_path(@micropost)
    else 
      render 'new'
    end
  end

  def destroy
    
  end

  private

    def micropost_params
      params.required(:micropost).permit(:content, :picture)
    end
end
