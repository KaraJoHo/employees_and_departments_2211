require './lib/department'
require './lib/employee'

RSpec.describe Department do 
  let(:customer_service) {Department.new("Customer Service")}

  let(:bobbi) {Employee.new({name: "Bobbi Jaeger", age: "30", salary: "$100000"})}
  let(:aaron) {Employee.new({name: "Aaron Tanaka", age: "25", salary: "90000"})}

  describe '#initialize' do 
    it 'exists and has a name and list of employees' do 
      expect(customer_service).to be_a(Department)
      expect(customer_service.name).to eq("Customer Service")
      expect(customer_service.employees).to eq([])
      expect(customer_service.expenses).to eq(0)
    end
  end

  describe '#hire' do 
    it 'adds employees to the list of employees' do 
      expect(customer_service.employees).to eq([]) 

      customer_service.hire(bobbi)
      customer_service.hire(aaron)

      expect(customer_service.employees).to eq([bobbi, aaron])
    end
  end

  describe '#expense' do 
    it 'adds an expense and raises expenses' do 
      expect(customer_service.expenses).to eq(0) 

      customer_service.expense(100)
      customer_service.expense(25)

      expect(customer_service.expenses).to eq(125)
    end
  end

  describe '#employee_total_expenses' do #it4
    it 'is a list of employees total expenses' do 
      customer_service.hire(bobbi)
      customer_service.hire(aaron)

      bobbi.expends(20)
      aaron.expends(35)

      expected = {
                  bobbi => 20, 
                  aaron => 35
      }

      expect(customer_service.employee_total_expenses).to eq(expected)
    end
  end

  describe '#department_track_expenses' do #it4
    it 'can track its employees expenses and return the total expense amount' do 
      customer_service.hire(bobbi)
      customer_service.hire(aaron)

      bobbi.expends(20)
      aaron.expends(35)

      expected = {
                  bobbi => 20, 
                  aaron => 35
      }

      expect(customer_service.employee_total_expenses).to eq(expected)
      expect(customer_service.department_track_expenses).to eq(55)
      expect(customer_service.expenses).to eq(55)
    end
  end
end