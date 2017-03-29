class CommentsController < ApplicationController
  before_action :find_helper
  before_action :find_comment, only: [:destroy, :edit, :update, :comment_owner]
  before_action :comment_owner, only: [:destroy, :edit, :update]

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

  def destroy
    @comment.destroy
    redirect_to helper_path(@helper)
  end

  def edit; end

  def update
    if @comment.update(params[:comment].permit(:content))
      redirect_to helper_path(@helper)
    else
      render 'edit'
    end
  end

  private

  def find_helper
    @helper = Helper.find(params[:helper_id])
  end

  def find_comment
    @comment = @helper.comments.find(params[:id])
  end

  def comment_owner
    unless current_user.id == @comment.user_id
      flash[:notice] = 'This comment is not editable by you'
      redirect_to @helper
    end
  end
end
