class FortuneController < ApplicationController
  before_action :set_fortune, only: [:show]

  def index
    @fortunes = Fortune.all
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
