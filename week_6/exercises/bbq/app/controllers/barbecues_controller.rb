class BarbecuesController < ApplicationController
  before_action :authenticate_user!

  def index
    @barbecues = Barbecue.order(:date)
  end

  def show
    # Don't add any code to this show action.
    # Implement your barbecue API in another action.
    @barbecue = Barbecue.find_by(id: params[:id])
    @users = @barbecue.users
    @items = @barbecue.items
    @item = @barbecue.items.new
  end

  def new
    @bbq = Barbecue.new
  end

  def create
    bbq_params = params.require(:barbecue).permit(:title, :venue, :date)
    @bbq = Barbecue.new(bbq_params)

    unless @bbq.save
      render(:new)
    else
      redirect_to(barbecues_path)
    end
  end
end
