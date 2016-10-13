class LikesController < ApplicationController

  def create
    @instruction = Instruction.find_by(title: params[:format].gsub('-', ' '))
    @instruction.likes.create_with_user({}, current_user)
    redirect_to(:back)
  end
end
