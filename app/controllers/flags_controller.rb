class FlagsController < ApplicationController
  def index_by_board
    board = Board.find(params[:board_id])

    render json: board.flags
  end
end
