class FortuneController < ApplicationController

  def index
    puts params["about"]
    if (params["about"].nil?)
      @fortunes = Fortune.all
    else
      @fortunes = Fortune.where('fortune LIKE ?', "%#{params["about"]}%").all
    end
    render json: @fortunes
  end

  def show
    @fortune = Fortune.find(params[:id])
    render json: @fortune
  end

  def random
    @fortune = Fortune.all.sample
    render json: @fortune
  end

  private

  def show_params
    # whitelist params
    params.permit(:fortune, :author)
  end

  def set_fortune
  end
end
