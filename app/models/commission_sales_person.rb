class CommissionSalesPerson < Employee

  def initialize(data = {})
    super(data)
    @commission = data['Commission'].to_f
  end

  def commission
    total_sales * @commission
  end

  def gross_salary
    monthly_salary
  end

  def net_pay
    (gross_salary + commission) * ( 1 - Employee.tax_rate )
  end

end
