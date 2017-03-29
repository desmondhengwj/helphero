class CommentsController < ApplicationController

  def create

  end

  private

  def find_helper
    @helper = Helper.find(params[:helper_id])
  end


end
