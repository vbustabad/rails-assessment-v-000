class AdoptionsController < ApplicationController
  before_action :require_admin, only: [:index, :show]
  before_action :require_owner, only: :create

  def index
    @adoptions = Adoption.all
  end

  def create
    @adoption = Adoption.new(dog_id: params[:dog], owner: current_user.owner)

    if @adoption.save
      Dog.find(params[:dog]).update_column(:adopted, true)
      flash[:notice] = "Dog has been successfully adopted."
      redirect_to user_path(current_user)
    else
      flash[:notice] = "Adoption was not successful."
      @dog = Dog.find(params[:dog])
      render "dogs/show"
    end
  end

  def show
    @adoption = Adoption.find(params[:id])
  end

end
