class FreelancersController < ApplicationController
  before_action :set_freelancer, only: [:show, :update, :edit, :destroy]

  def index
    if params.present?
      query = Freelancer.where(rate: params[:query1]..params[:query2])
      @pagy, @freelancers = pagy(query.order(feature: :desc))
    else
      @pagy, @freelancers = pagy(Freelancer.order(feature: :desc))
    end
    # @pagy, @records = pagy(Product.some_scope)
    # @pagy, @freelancers = pagy(Freelancer.where(rate: 1..300))
  end

  def show
  end

  def new
    @freelancer = Freelancer.new
  end 

  def create
    @freelancer = Freelancer.new(freelancer_params)
    @freelancer.user = current_user
    if @freelancer.save
      redirect_to freelancer_path(@freelancer)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @freelancer.update(freelancer_params)
      redirect_to freelancer_path(@freelancer)
    else  
      render :show, status: :unprocessable_entity
    end
  end

  def destroy
    @freelancer.destroy
    redirect_to freelancer_path, status: :see_other
  end

  private

  def set_freelancer
    @freelancer = Freelancer.find(params[:id])
  end

  def freelancer_params
    params.require(:freelancer).permit(:feature, :bio, :rate)
  end
end
