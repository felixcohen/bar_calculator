class TabsController < ApplicationController
  before_action :set_tab, only: [:show, :edit, :update, :destroy]

  respond_to :html, :js

  def index
    @tabs = Tab.unpaid
    respond_with(@tabs)
  end

  def show
    respond_with(@tab)
  end

  def new
    @tab = Tab.new
    respond_with(@tab)
  end

  def edit
  end

  def choose 
    @tab = Tab.find(params[:id])
    session[:tab_id] = @tab.id
    redirect_to '/till', notice: @tab.name+' chosen'
  end

  def pay 
    @tab = Tab.find(params[:id])
    @tab.paid = true
    if @tab.save 
      session[:tab_id] = nil
      redirect_to tabs_path, notice: @tab.name+' paid' 
    else
      respond_to do |format|
        format.js { render json: @sale.errors, status: :unprocessable_entity }
      end
    end
  end

  def create
    @tab = Tab.new(tab_params)
    if @tab.save
      session[:tab_id] = @tab.id
      redirect_to '/till', notice: @tab.name+' created'
    end
  end

  def update
    if @tab.update(tab_params)
        format.html { redirect_to root_path, notice: @tab.name+' updated' }
        format.js { render :status => 200 }
        format.json { render :status => 200 }
      else
        format.html { render :new }
        format.json { render json: @sale.errors, status: :unprocessable_entity }
    end
  end

  def destroy
    @tab.destroy
    respond_with(@tab)
  end

  private
    def set_tab
      @tab = Tab.find(params[:id])
    end

    def tab_params
      params.require(:tab).permit(:name, :status, :paid)
    end
end
