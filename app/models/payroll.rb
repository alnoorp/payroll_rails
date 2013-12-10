require 'csv'
require 'pry'
require_relative 'float'

filename = 'employee_data.csv'
employees = Employee.load_employees(filename)
sales_file = 'sales.csv'
all_sales = Sale.sales_list(sales_file)

employees.each do |person|
  puts "***#{person.name}***"
  puts "Gross Salary: $#{person.gross_salary.floor_to(2)}"
  puts "Commission: $#{person.commission.floor_to(2)}" if person.methods.include?(:commission)
  puts "Net Pay: $#{person.net_pay.floor_to(2)}"
  puts "***"
  puts
end
