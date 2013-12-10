class Employee
  @@all_employees = []
  attr_reader :name, :base_salary, :title, :commission_rate

  def initialize(data = {})
    @name = data['Name']
    @base_salary = data['Base Salary'].to_f
    @title = data['Title']
    @commission_rate = data['Commission'].to_f
    @sales = []
  end

  def monthly_salary
    @base_salary / 12
  end

  def gross_salary
    monthly_salary
  end

  def net_pay
    gross_salary * ( 1 - Employee.tax_rate )
  end

  def add_sale(sale)
    @sales << sale
  end

  def total_sales
    @total = 0
    @sales.each do |sale|
      @total += sale.gross_sale_value
    end
    @total
  end

  class << self
    def tax_rate
      0.3
    end

    def all_employees
      @@all_employees
    end

    def employee_named(name)
      @@all_employees.find{|employee| employee.name.include?(name) }
    end

    def load_employees(filename)
      CSV.foreach(filename, headers: true) do |row|
        data = row.to_hash
        if row['Type'] == 'Commission'
          @@all_employees << CommissionSalesPerson.new(data)
        elsif row['Type'] == 'Quota'
          @@all_employees << QuotaSalesPerson.new(data)
        elsif row['Type'] == 'Owner'
          @@all_employees << Owner.new(data)
        else
          @@all_employees << Employee.new(data)
        end
      end
      @@all_employees
    end
  end
end
