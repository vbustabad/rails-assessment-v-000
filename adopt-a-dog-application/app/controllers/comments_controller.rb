class CommentsController < ApplicationController
  before_action :require_owner, except: [:index]
  before_action :require_admin, only: [:index]

  def index
    @adoption = Adoption.find(params[:adoption_id])
    @comments = Comment.all
  end

  def new
    @adoption = Adoption.find(params[:adoption_id])
    @comment = @adoption.comments.build
  end

  def create
    @comment = Comment.new(comment_params)

    if @comment.save
      redirect_to adoption_comment_path(@adoption, @comment)
    else
      render :new
    end
  end

  def show
    @adoption = Adoption.find(params[:adoption_id])
    @comment = Comment.find(params[:id])
  end

  def edit
    @adoption = Adoption.find(params[:adoption_id])
    @comment = Comment.find(params[:id])
  end

  def update
    @adoption = Adoption.find(params[:adoption_id])
    @comment = Comment.find(params[:id])
    @comment.update(comment_params)

    if @comment.save
      redirect_to adoption_comment_path(@adoption, @comment)
    else
      render :edit
    end
  end

  def destroy
    @adoption = Adoption.find(params[:adoption_id])
    @comment = Comment.find(params[:id])
    @comment.destroy
  end

  private

  def comment_params
    params.permit(:feedback)
  end

end
