class OrdersController < ApplicationController
  before_action :authenticate_user!, except: [:hook]
  before_action :authenticate_admin!, only: [:all_index]


  def index
    @orders = current_user.orders.all
  end

  def all_index
    @orders = Order.all
    render :index
  end


  # GET /order/new
  def new
    @order = Order.new
    #@order.build_card
  end

  def show
    @order=Order.find(params[:id])
    if @order.user != current_user
      redirect_to home_index_path, alert: "You are not allowed to go see this order"
    end
  end

  # POST /order
  def create
    @order = Order.new #@order = Order.new(order_params)
    @order.user = current_user
    @order.amount = current_user.total_cart
    @order.time_delivery = params[:date]+" at "+params[:hour]
    #@order.invoice = (current_user.user_boxes.where.not(quantity: 0) + current_user.user_products).map{|item| "#{item.name} x #{item.quantity} #{item.price}" }
    @invoice=[]
    current_user.user_products.each do |up|
      @invoice.push(["Product", up.quantity, up.name])
    end
    current_user.user_boxes.where.not(quantity: 0).each do |ub|
      box_content=[]
      ub.content.each do |product, count|
        box_content.push([count, product.name])
      end
      @invoice.push(["Box", ub.quantity, ub.name, box_content])
    end
    @order.invoice=@invoice
    #@order.card.ip_address = request.remote_ip


    if @order.save
      #case params['payment_method']
      #  when "paypal"
          redirect_to @order.paypal_url(home_index_path) # The arg is the order#show order_path @order
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

      @order.user.user_boxes.destroy_all
      @order.user.user_products.destroy_all
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
