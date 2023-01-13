class Budget 
  attr_reader :year, :departments
  
  def initialize(year)
    @year = year
    @departments = []
  end

  def add_department(department)
    @departments << department
  end

  def less_than_500 
    @departments.find_all do |department| 
      department.expenses < 500
    end
  end

  def all_employees #helper, array of all employees
    @departments.flat_map do |department| 
      department.employees
    end
  end

  def employee_salaries 
    employee_salary_hash = {} 

    all_employees.each do |employee| 
      employee_salary_hash[employee] = employee.salary
    end
    employee_salary_hash
  end
end