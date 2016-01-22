class CommentsController < ApplicationController
	load_and_authorize_resource

	before_action :load_authorize_parent
	before_action :authenticate_user_from_token!

	def index
		@comments = @movie.comments.paginate(:per_page => 10, :page => params[:page])
	end
	def show

	end
	def new
		@user_token = params[:user_token]
	end

	def create
		@comment = @movie.comments.new(comment_params)
		@comment.user_id = current_user.id
		respond_to do |format|
			if @comment.save
				flash[:notice] = "Comment created successfully"
				format.html { redirect_to thank_you_path}
				format.json { render :show, status: :created, location: @comment }
			else
				format.html { render :new }
				format.json { render json: @comment.errors, status: :unprocessable_entity }
			end
		end
	end
	def edit
	end

	def approve
		@comment.status = 'approve'
		@comment.approved_by=current_user.first_name
		respond_to do |format|
			if @comment.update_attributes
				format.html { redirect_to movie_comments_path(@movie)}
				format.json { render :show, status: :ok, location: @comment }
			end
		end
	end
	def reject
		@comment.status = 'reject'
		@comment.approved_by=current_user.first_name
		respond_to do |format|
			if @comment.update_attributes
				format.html { redirect_to movie_comments_path(@movie)}
				format.json { render :show, status: :ok, location: @comment }
			end
		end
	end

	def update

		respond_to do |format|
			if @comment.update(comment_params)
				flash[:notice] = "Comment updated successfully"
				format.html { redirect_to movie_comments_path(@movie), notice: 'Comment was successfully updated.' }
				format.json { render :show, status: :ok, location: @comment }
			else
				format.html { render :edit }
				format.json { render json: @comment.errors, status: :unprocessable_entity }
			end
		end
	end

	def destroy
		@comment.destroy
		respond_to do |format|
			flash[:notice] = "Comment destroyed successfully"
			format.html { redirect_to movie_comments_path(@movie) }
			format.json { head :no_content }
		end
	end

	private
	def comment_params
		params.require(:comment).permit(:rating, :review, :movie_id,:status)
	end

	def load_authorize_parent
		if params[:movie_id].present?
			@movie = Movie.find(params[:movie_id])
		end
	end
end
