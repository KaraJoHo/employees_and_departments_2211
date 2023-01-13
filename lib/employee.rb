class Employee 
  attr_reader :name, :age, :salary, :total_expenses

  def initialize(attributes)
    @name = attributes[:name]
    @age = attributes[:age].to_i
    @salary = attributes[:salary].delete('$').to_i
    @total_expenses = 0
  end

  def give_raise(amount)
    @salary += amount
  end

  def expends(amount)
    @total_expenses += amount
  end
end