class InstructionsController < ApplicationController
  def new
    @instruction = Instruction.new
    @categories = Category.all
  end

  def create
    @instruction = current_user.instructions.create(instruction_params)
    if @instruction.save
      redirect_to instruction_path(@instruction)
    else
      @categories = Category.all
      render new_instruction_path
    end
  end

  def show
    @instruction = Instruction.friendly.find(params[:id])
  end

  private

  def instruction_params
    params.require(:instruction).permit(:title, :description, :image, :category_id)
  end
end
