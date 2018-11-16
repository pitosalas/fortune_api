class FortuneController < ApplicationController
  before_action :set_fortune, only: [:show]

  def index
    puts params["about"]
    if (params["about"].nil?)
      @fortunes = Fortune.all
    else
      @fortunes = Fortune.where('fortune LIKE ?', "%#{params["about"]}%").all
    end
    json_response(@fortunes)
  end

  def show
    json_response(@fortune)
  end

  def random
    @fortune = Fortune.all.sample
    json_response(@fortune)
  end

  private

  def show_params
    # whitelist params
    params.permit(:fortune, :author)
  end

  def set_fortune
    @fortune = Fortune.find(params[:id])
  end
end
