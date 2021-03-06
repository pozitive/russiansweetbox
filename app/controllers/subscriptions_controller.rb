class SubscriptionsController < ApplicationController
  before_action :set_subscription, only: [:show, :edit, :update, :destroy]
  before_filter :auth_user

  # GET /subscriptions
  # GET /subscriptions.json
  # def index
  #   @subscriptions = Subscription.all
  # end

  # GET /subscriptions/1
  # GET /subscriptions/1.json
  def show
  end

  # GET /subscriptions/new
  def new
    @subscription = Subscription.new
  end

  # POST /subscriptions
  # POST /subscriptions.json
  def create
    @subscription = Subscription.new(subscription_params)

    respond_to do |format|
      if @subscription.save_with_payment
        format.html { redirect_to @subscription, notice: 'Subscription was successfully created.' }
        format.json { render :show, status: :created, location: @subscription }
      else
        format.html { render :new }
        format.json { render json: @subscription.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /subscriptions/1
  # PATCH/PUT /subscriptions/1.json
  # def update
  #   respond_to do |format|
  #     if @subscription.update(subscription_params)
  #       format.html { redirect_to @subscription, notice: 'Subscription was successfully updated.' }
  #       format.json { render :show, status: :ok, location: @subscription }
  #     else
  #       format.html { render :edit }
  #       format.json { render json: @subscription.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # DELETE /subscriptions/1
  # DELETE /subscriptions/1.json
  # def destroy
  #   @subscription.destroy
  #   respond_to do |format|
  #     format.html { redirect_to subscriptions_url, notice: 'Subscription was successfully destroyed.' }
  #     format.json { head :no_content }
  #   end
  # end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_subscription
      @subscription = Subscription.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def subscription_params
      params.require(:subscription).permit(:first_name, :last_name, :street_address, :unit, :city, :state, :country, :postal_code, :user_id, :stripe_card_token)
    end

    def auth_user
      redirect_to new_user_registration_url unless user_signed_in?
    end

end
