class Api::V1::TrainsController < ApplicationController
  before_action :restrict_access


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

    def restrict_access
    authenticate_or_request_with_http_token do |api_key, options|
      User.find_by(:email => request.headers["X-User-Email"], :api_key => api_key)
    end
  end



end


