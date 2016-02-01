class Order < ActiveRecord::Base
  belongs_to :user

  validates :amount, :invoice, :user, presence: true

  #has_one :card
  #accepts_nested_attributes_for :card

  #def payment_method
  # if card.nil? then "paypal"; else "card"; end
  #end

  serialize :notification_params, Hash
  def paypal_url(return_path)
    values = {
        business: "prdv-facilitator@gmail.com",
        cmd: "_xclick",
        upload: 1,
        return: "#{Rails.application.secrets.app_host}#{return_path}",
        invoice: self.id,
        amount: self.amount, # list total cart
        item_name: 'Paris RDV Pick up', # order.delivery_type   = 'Pick Up'
        item_number: self.id, # order.id / should be pick_category_id
        quantity: '1',
        notify_url: "#{Rails.application.secrets.app_host}/hook"
    }
    "#{Rails.application.secrets.paypal_host}/cgi-bin/webscr?" + values.to_query
  end


end
