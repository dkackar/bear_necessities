class BearsController < ApplicationController

  def index
   @bears = Bear.all
  end

  def new
   @bear = Bear.new
  end

  def create
   @bear = Bear.new(bear_params)
   if @bear.save
      flash[:notice] = "Successfully created a new Bear!!"
      redirect_to bear_path(@bear.id)
    else
       flash.now[:error] = "Could not create a new Bear!!"
       render "new"
    end
  end

  def show
    @bear = Bear.find(params[:id])
  end

  def edit
    @bear = Bear.find(params[:id])
  end

  def update
    @bear = Bear.find(params[:id])
    if @bear.update(bear_params)
       flash[:notice] = "Successfully updated Bear Info!!"
       redirect_to bear_path(@bear.id)
    else
       flash.now[:error] = "Could not save  the Bear information!!"
       render "edit"
    end   
  end


  def destroy
    @bear = Bear.find(params[:id])
    @bear.destroy
    redirect_to bears_path
  end

  private
  def bear_params
    params.require(:bear).permit(:name,:description)
  end
end
