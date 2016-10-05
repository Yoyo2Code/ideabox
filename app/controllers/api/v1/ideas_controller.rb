class Api::V1::IdeasController < ApplicationController
  respond_to :json

  def index
    render json: @ideas = Idea.all
  end

  def create
    render json: Idea.create(idea_params)
  end

  def delete
    render json: Idea.delete(params[:id])
  end

  private

    def idea_params
      params.require(:idea).permit(:title, :body)
    end
end
