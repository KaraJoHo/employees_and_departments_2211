class Department 
  attr_reader :name, :employees, :expenses

  def initialize(name)
    @name = name 
    @employees = []
    @expenses = 0
  end

  def hire(employee) #array of employee objects
    @employees << employee
  end

  def expense(amount)
    @expenses += amount
  end

  def employee_total_expenses 
    total_expenses_hash = {}

    @employees.each do |employee| 
      total_expenses_hash[employee] = employee.total_expenses
    end
    total_expenses_hash
  end

  def department_track_expenses 
   
    expense(employee_total_expenses.values.sum)
  end
end