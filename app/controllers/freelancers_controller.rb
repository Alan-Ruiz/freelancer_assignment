class FreelancersController < ApplicationController
  before_action :set_freelancer, only: [:show, :update, :destroy]
  
  def index
    if params[:query2].present?
      query = Freelancer.where(rate: params[:query1]..params[:query2]).order(feature: :desc).map do  |freelancer| 
        freelancer.attributes.merge!("full_name" => freelancer.full_name)
      end
      pagy, freelancers = pagy_array(query)
      render(partial: 'freelancers', locals: { freelancers: freelancers, pagy: pagy })
    else
      @pagy, @freelancers = pagy_array(all_freelancers)
    end
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

  def all_freelancers
    Rails.cache.fetch("all_freelancers", expires_in: 24.hours) do
      Freelancer.order(feature: :desc).map do  |freelancer| 
        freelancer.attributes.merge!("full_name" => freelancer.full_name)
      end
    end
  end
end
