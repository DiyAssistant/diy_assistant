class SearchesController < ApplicationController

  def index
    @instructions = Instruction.search_all(params[:q])
                            .paginate(page: params[:page], per_page: 5)
  end

end
