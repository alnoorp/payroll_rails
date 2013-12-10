require_relative '../models/payroll'

class SalesController < ApplicationController

  respond_to :html
  # GET /sales
  def index
    # make your sales objects available to the correlating view here
    @sales_list = Sale.sales_list('sales.csv')
  end
end
