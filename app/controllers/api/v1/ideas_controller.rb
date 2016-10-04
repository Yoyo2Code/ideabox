class Api::V1::IdeasController < ApplicationController
  respond_to :json

  def index
    render json: @ideas = Idea.all
  end
end
