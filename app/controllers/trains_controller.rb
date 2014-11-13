class TrainsController < ApplicationController


  def index
    @trains = Train.all
  end

  def show
    @train = Train.find_by(:id => params[:id])
  end

  def create
    @train = Train.create(train_params)
  end

  def update
    @train = Train.find_by(:id => params[:id])
    @train.update(train_params)
  end

  def destroy
    @train = Train.find_by(:id => params[:id])
    @train.destroy
  end


  private

  def train_params
    return params.require(:train).permit(:name, :status, :id)
  end

end


