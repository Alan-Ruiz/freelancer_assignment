class FreelancersController < ApplicationController
  before_action :set_freelancer, only: [:show, :edit, :destroy]

  def index
    @freelancers = Freelancer.order(feature: :desc)
  end

  def show

  end

  def new
    @freelancer = Freelancer.new
  end 

  def create
    
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def set_freelancer
    @freelancer = Freelancer.find(params[:id])
  end
end
