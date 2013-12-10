class Owner < Employee

  def initialize(data = {})
    super(data)
    @quota = data['Quota'].to_f
    @bonus = data['Bonus'].to_f
  end

  def gross_salary
    if exceed_quota?
      monthly_salary + @bonus
    else
      monthly_salary
    end
  end

  def net_pay
    gross_salary * ( 1 - Employee.tax_rate )
  end

  private

  def exceed_quota?
    grand_total_sales = 0
    @@all_employees.each do |employee|
      grand_total_sales += employee.total_sales
    end
    grand_total_sales > @quota
  end
end
