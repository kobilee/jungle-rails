class ReceiptMailer < ApplicationMailer
  default from: 'no-reply@jungle.com'

  def receipt_email(order, url)
    @order = order
    @url  = url
    @items = LineItem.where order_id: @order.id
    @items.each do |item|
      item.product = Product.find_by id: item.product_id
    end

    mail to: @order.email, subject: "Order Receipt (# #{order.id})"
  end
end
