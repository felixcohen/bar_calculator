class BusinessesController < ApplicationController
  before_action :set_business, only: [:show, :edit, :update, :destroy,:invite_user]
  before_action :authenticate_user!


  # GET /businesses
  # GET /businesses.json
  def index
    @business = current_user.business
    @products = current_user.business.products.current
    @date = Date.today
    @days = Sale.group('DATE(created_at)').count('created_at')
  end


  def report
    @date = Date.parse(params[:date])
    @products = Product.all
  end

  def invite_user 
    @business.generate_token
    UserInviteMailer.invite_email(params[:email], @business)
    respond_to do |format|
        format.html { redirect_to @business, notice: 'User was successfully invited.' }
        format.json { render :show, status: :created, location: @business }
    end
  end 

  def admin
    @business = Business.find(params[:id])
  end

  # GET /businesses/1
  # GET /businesses/1.json
  def show
    @products = current_user.business.products
  end

  # GET /businesses/new
  def new
    @business = Business.new
  end

  # GET /businesses/1/edit
  def edit
  end

  # POST /businesses
  # POST /businesses.json
  def create
    @business = Business.new(business_params)

    respond_to do |format|
      if @business.save
        format.html { redirect_to @business, notice: 'Business was successfully created.' }
        format.json { render :show, status: :created, location: @business }
      else
        format.html { render :new }
        format.json { render json: @business.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /businesses/1
  # PATCH/PUT /businesses/1.json
  def update
    respond_to do |format|
      if @business.update(business_params)
        format.html { redirect_to @business, notice: 'Business was successfully updated.' }
        format.json { render :show, status: :ok, location: @business }
      else
        format.html { render :edit }
        format.json { render json: @business.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /businesses/1
  # DELETE /businesses/1.json
  def destroy
    @business.destroy
    respond_to do |format|
      format.html { redirect_to businesses_url, notice: 'Business was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_business
      @business = Business.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def business_params
      params.require(:business).permit(:name, :user_ids)
    end
end
