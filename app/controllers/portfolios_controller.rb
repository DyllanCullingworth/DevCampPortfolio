class PortfoliosController < ApplicationController
  layout "portfolio"

  before_action :set_portfolio_item, only: [:show, :edit, :update, :destroy]

  def index
    @portfolio_items = Portfolio.all
  end

  def angular
    @angular_portfolio_items = Portfolio.angular
  end

  def new
    @portfolio_item = Portfolio.new
    3.times { @portfolio_item.technologies.build }
  end

  def create
    @portfolio_item = Portfolio.new(portfolio_params)
    if @portfolio_item.save
      flash[:notice] = "Success"
      redirect_to portfolios_path
    else
      flash[:alert] = "Failure"
      render new
    end
  end

  def edit

  end

  def show

  end

  def update
    if @portfolio_item.update(portfolio_params)
      flash[:notice] = "Success"
      redirect_to portfolios_path
    else
      flash[:alert] = "Failure"
      render new
    end
  end

  def destroy
    @portfolio_item.destroy
    flash[:notice] = "Portfolio item deleted successfully"
    redirect_to portfolios_path
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_portfolio_item
    @portfolio_item = Portfolio.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def portfolio_params
    params.require(:portfolio).permit(:title, :subtitle, :body, :main_image, :thumb_image, technologies_attributes: [:name] )
  end

end
