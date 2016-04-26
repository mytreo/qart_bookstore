module OrdersHelper
  def order_info(order)
    result = "<p><b>Address </b>"+order.address+"</p>"
    result += "<p><b>Created </b>"+order.created_at.to_s+"</p>"
    if order.status=0
      result+="<p><b>Status: </b>in progress</p>"
    elsif order.status<0
      result+="<p><b>Status: </b>rejected("+order.updated_at.to_s+")</p>"
    else
      result+="<p><b>Status: </b>comleted("+order.updated_at.to_s+")</p>"
    end
       result+="<p><b>Total price: </b>"+number_to_currency(order.total_price, precision: 2,unit: '₴')+"</p>"
    sanitize(result)
  end
end
