require './lib/department'
require './lib/employee' 
require './lib/budget'

RSpec.describe Budget do 
  let(:budget) {Budget.new(2010)}

  let(:customer_service) {Department.new("Customer Service")}
  let(:tech_support) {Department.new("Tech Support")}

  let(:jermajesty) {Employee.new({name: "Jermajesty Jackson", age: "30", salary: "$100000"})}
  let(:chip) {Employee.new({name: "Chip Munk", age: "25", salary: "90000"})}
  let(:inigo) {Employee.new({name: "Inigo Montoya", age: "25", salary: "120000"})}
  let(:tyler) {Employee.new({name: "Tyler Durden", age: "25", salary: "85000"})}

  describe '#initialize' do 
    it 'exists and has a name' do 
      expect(budget).to be_a(Budget) 
      expect(budget.year).to eq(2010)
    end
  end

  describe 'departments/add_department' do 
      it 'has a list of departments and can add departments' do 
      expect(budget.departments).to eq([])

      budget.add_department(customer_service)
      budget.add_department(tech_support)

      expect(budget.departments).to eq([customer_service, tech_support])
    end
  end

  describe '#less_than_500' do 
    it 'can list departments with expenses less than 500' do 
      
      tech_support.hire(jermajesty) 
      tech_support.hire(chip)
      customer_service.hire(inigo)
      customer_service.hire(tyler)

      tech_support.expense(600)
      customer_service.expense(200)

      expect(budget.less_than_500).to eq([customer_service])
    end
  end

end