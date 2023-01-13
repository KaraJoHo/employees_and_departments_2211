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
end