class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_admin!, only: [:index]


  def index
    @orders = Order.all
  end


  # GET /order/new
  def new
    @order = Order.new
    #@order.build_card
  end

  def show
    @order=Order.find(params[:id])
  end

  # POST /order
  def create
    @order = Order.new #@order = Order.new(order_params)
    @order.user = current_user
    @order.amount = current_user.total_cart
    @order.invoice = (current_user.user_boxes.where.not(quantity: 0) + current_user.user_products).map{|item| "#{item.name} x #{item.quantity} #{item.price}" }
    #@order.card.ip_address = request.remote_ip

    if @order.save
      #case params['payment_method']
      #  when "paypal"
          redirect_to @order.paypal_url(order_path @order) # The arg is the order#show
      #  when "card"
      #    if @order.card.purchase
      #      redirect_to order_path(@order), notice: @order.card.card_transaction.message
      #    else
      #      redirect_to order_path(@order), alert: @order.card.card_transaction.message
      #    end
      #end
    else
      render :new
    end
  end


  protect_from_forgery except: [:hook]
  def hook
    params.permit! # Permit all Paypal input params
    status = params[:payment_status]

    if status == "Completed"
      @order = Order.find params[:invoice]
      @order.update_attributes notification_params: params, status: status, transaction_id: params[:txn_id], purchased_at: Time.now
    end
    render nothing: true
  end




  private

    # Never trust parameters from the scary internet, only allow the white list through.
  #def order_params
    #params.require(:order).permit(
                                            # card_attributes: [
                                             # :first_name, :last_name, :card_type, :card_number,
                                             # :card_verification, :card_expires_on]
                                              #)
  #end



end
