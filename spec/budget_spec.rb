require './lib/department'
require './lib/employee' 
require './lib/budget'

RSpec.describe Budget do 
  let(:budget) {Budget.new(2010)}

  let(:customer_service) {Department.new("Customer Service")}

  let(:bobbi) {Employee.new({name: "Bobbi Jaeger", age: "30", salary: "$100000"})}
  let(:aaron) {Employee.new({name: "Aaron Tanaka", age: "25", salary: "90000"})}

  describe '#initialize' do 
    it 'exists and has a name' do 
      expect(budget).to be_a(Budget) 
      expect(budget.year).to eq(2010)
    end
  end

end