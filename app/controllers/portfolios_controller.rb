class PortfoliosController < ApplicationController

  def index
    @portfolio_items = Portfolio.all
  end

  def new
    @portfolio_item = Portfolio.new
  end

  def create
    @portfolio_item = Portfolio.new(portfolio_params)
    if @portfolio_item.save
      flash[:notice] = "Success"
      redirect_to portfolios_path
    else
      flash[:alert]
      render new
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_portfolio_item
    @portfolio_item = Portfolio.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def portfolio_params
    params.require(:portfolio).permit(:title, :subtitle, :body, :main_image, :thumb_image )
  end

end
