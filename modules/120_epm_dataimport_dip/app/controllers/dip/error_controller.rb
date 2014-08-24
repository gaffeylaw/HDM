class Dip::ErrorController < ApplicationController
  layout "bootstrap_application_full"

  def index
    respond_to do |format|
      format.html
    end
  end

  def get_data
    order_name=params[:order_name]
    order_value=params[:order_value]
    order="sheet_no,row_number,message"
    if (order_name)
      order=order_name +" "+order_value
    end
    locale="EN"
    if I18n.locale.to_s.upcase=="ZH"
      locale='ZH'
    end
    dip_error_scope = Dip::Error.where(:batch_id => params[:batchId], :locale => locale).order(order)
    dip_errors, count = paginate(dip_error_scope)
    respond_to do |format|
      format.html {
        @datas = dip_errors
        @count = count
      }
    end
  end

end