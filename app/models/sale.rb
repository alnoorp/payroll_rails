class Sale
  attr_reader :last_name, :gross_sale_value

  def commission_due
    gross_sale_value * Employee.employee_named(last_name).commission_rate
  end

  def initialize(data)
    @last_name = data['last_name']
    @gross_sale_value = data['gross_sale_value'].to_f
  end

  def self.sales_list(filename)
    @sales_array = []
    CSV.foreach(filename, headers: true) do |row|
      data = row.to_hash
      sale = Sale.new(data)
      @sales_array << sale
      found_employee = Employee.employee_named(row['last_name'])
      found_employee.add_sale(sale)
    end
    @sales_array
  end

  def net_commission
    commission_due.floor_to(2) if commission_due > 0
  end
end
