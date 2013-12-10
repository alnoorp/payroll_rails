class QuotaSalesPerson < Employee
  attr_reader :quota, :bonus
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
    total_sales > @quota
  end
end
