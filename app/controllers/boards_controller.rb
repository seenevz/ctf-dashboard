class BoardsController < ApplicationController

    def show
        @board = Board.find(params[:id])
    end

    def new
        @board = Board.new
    end

    def create
        new_board = Board.new(board_params)
        new_board.owner = @current_user
        byebug
        if new_board.valid?
            params[:flags].each do |flag|
                Flag.create(value: flag, board: new_board)
            end

            render json: new_board
        else
            render json: { error: "Could not create board", errors: new_board.errors.full_messages }
        end
    end

    private

    def board_params
        params.require(:board).permit(:title, :description)
    end
end
