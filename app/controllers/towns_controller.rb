class TownsController < ApplicationController
  before_action :authenticate_user!, except: [:top, :facility, :food, :event, :fukufuku]
  def top
  end
  
  def facility
  end
  
  def index
    @towns= Town.all
    if params[:search] == nil
      @towns= Town.all
    elsif params[:search] == ''
      @towns= Town.all
    else
      @towns = Town.where("about LIKE ? ",'%' + params[:search] + '%')
    end
  end

  def new
    @town = Town.new
  end

  def create
    town = Town.new(town_params)
    town.user_id = current_user.id
    if town.save
      redirect_to :action => "index"
    else
      redirect_to :action => "new"
    end
  end

  def show
    @town = Town.find(params[:id])
    @comments = @town.comments
    @comment = Comment.new
  end

  def edit
    @town = Town.find(params[:id])
  end

  def update
    town = Town.find(params[:id])
    if town.update(town_params)
      redirect_to :action => "show", :id => town.id
    else
      redirect_to :action => "new"
    end
  end

  def destroy
    town = Town.find(params[:id])
    town.destroy
    redirect_to action: :index
  end

  def facility
  end

  def event
  end

  def food
  end

  def fukufuku
  end

  private
  def town_params
    params.require(:town).permit(:content, :about, :title, :image)
  end
end
