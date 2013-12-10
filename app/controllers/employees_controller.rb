require_relative '../models/payroll'

class EmployeesController < ApplicationController

  respond_to :html
  # GET /employees
  def index
    # make your employee objects available to the correlating view here
    @employees = Employee.all_employees
  end
end
