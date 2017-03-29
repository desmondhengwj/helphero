class CommentsController < ApplicationController
  before_action :find_helper

  def create
    @comment = @helper.comments.create(params[:comment].permit(:content))
    @comment.user_id = current_user.id
    @comment.save

    if @comment.save
      redirect_to helper_path(@helper)
    else
      render 'new'
    end
  end

  private

  def find_helper
    @helper = Helper.find(params[:helper_id])
  end


end
