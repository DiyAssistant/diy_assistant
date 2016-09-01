class SearchesController < ApplicationController

  def index
    @instructions = Instruction.search_all params[:q]
    @instructions = @instructions.page(params[:page]).per(5)
  end

end
