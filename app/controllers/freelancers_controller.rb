class FreelancersController < ApplicationController
  before_action :set_freelancer, only: [:show, :update, :edit, :destroy]
  
  def index
    if params[:query1].present?
      query = Freelancer.where(rate: params[:query1]..params[:query2])
      @pagy, @freelancers = pagy(query.order(feature: :desc))
    else
      # @pagy, @freelancers = pagy(Freelancer.includes(:user).where(id: all_freelancers_ids))
      @pagy, @freelancers = pagy(all_freelancers_ids)
      #preload users because that is how it is shown on the index page (freelance.user)
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
    params.require(:freelancer).permit(:feature, :bio, :rate, :user_id)
  end

  def all_freelancers_ids
    Rails.cache.fetch("all_freelancers", expires_in: 24.hours) do
      puts "HEELO IM HERE YOOOOOOOOO"
      Freelancer.includes(:user).order(feature: :desc)
    end

    #caching activerecords
  end

  # def all_freelancers
  #   Rails.cache.fetch("all_freelancers", expires_in: 24.hours) do
  #     Freelancer.order(feature: :desc)
  #   end
  # end
end
