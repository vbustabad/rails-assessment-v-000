class CommentsController < ApplicationController
  before_action :require_owner, except: [:index]
  before_action :require_admin, only: [:index]

  def index
    @comments = Comment.all
  end

  def new
    @adoption = Adoption.find(params[:adoption_id])
    @comment = @adoption.comments.build
  end

  def create
    @comment = Comment.new(comment_params)

    if @comment.save
      redirect_to adoption_comment_path(params[:adoption_id], @comment)
    else
      render :new
    end
  end

  def show
    @comment = Comment.find(params[:id])
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])
    @comment.update(comment_params)

    if @comment.save
      redirect_to adoption_comment_path(params[:adoption_id], @comment)
    else
      render :edit
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
  end

  private

  def comment_params
    params.require(:comment).permit(:feedback)
  end

end
