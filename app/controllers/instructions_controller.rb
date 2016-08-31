class InstructionsController < ApplicationController

  def new
    @instruction = Instruction.new
    @categories = Category.all
  end

  def create
    @instruction = current_user.instructions.create(instruction_params)
    redirect_to instruction_path(@instruction)
  end

  def show
    @instruction = Instruction.find(params[:id])
  end

  private

  def instruction_params
    params.require(:instruction).permit(:title, :description, :category_id)
  end
end
