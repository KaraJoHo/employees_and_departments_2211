class Department 
  attr_reader :name, :employees 

  def initialize(name)
    @name = name 
    @employees = []
  end

  def hire(employee) #array of employee objects
    @employees << employee
  end
end