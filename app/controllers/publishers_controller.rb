class PublishersController < ApplicationController
    before_action :authenticate_user!
  before_action :set_publisher, only: %i[edit show update destroy]
  def new
    @publisher = Publisher.new
  end

  def create
    @publisher = Publisher.new(publisher_params)
    if @publisher.save
      redirect_to publishers_path
      flash[:notice] = "New Publisher added"
    else
      render :new
    end
  end

  def edit
  end

  def show
  end

  def update
    if @publisher.update(publisher_params)
      redirect_to publishers_path
    else
      render :edit
    end
  end

  def destroy
    if @publisher.destroy
      redirect_to publishers_path
    end
  end

  def index
    @publishers = Publisher.all
  end

  private 
  def publisher_params
    params.require(:publisher).permit(:name)
  end
  def set_publisher
    @publisher = Publisher.find(params[:id])
  end
end
