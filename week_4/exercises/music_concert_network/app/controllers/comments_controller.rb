class CommentsController < ApplicationController

	def create
		@concert = Concert.find_by(id: params[:concert_id])
		@concert.comments.create(comment_params)

		redirect_to concert_path(params[:concert_id])
	end

	private

	def comment_params
		params.require(:comment).permit(:text)
	end
end
