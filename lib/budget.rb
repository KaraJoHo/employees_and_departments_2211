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
end