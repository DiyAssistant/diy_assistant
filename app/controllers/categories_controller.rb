class CategoriesController < ApplicationController

  def show
    @category_id = Category.find_by(name: params[:id].capitalize).id
    @instructions = Instruction.where(category_id: @category_id)
  end
end
