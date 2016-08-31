class SearchesController < ApplicationController

  def index
    @instructions = Instruction.search_all params[:q]
  end

end
