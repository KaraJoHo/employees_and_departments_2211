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

      budget.add_department(customer_service)
      budget.add_department(tech_support)

      expect(budget.less_than_500).to eq([customer_service])
    end
  end

  describe '#employee_salaries' do 
    it 'can list all employees salaries' do 
      tech_support.hire(jermajesty) 
      tech_support.hire(chip)
      customer_service.hire(inigo)
      customer_service.hire(tyler)

      tech_support.expense(600)
      customer_service.expense(200)

      budget.add_department(customer_service)
      budget.add_department(tech_support)

      expected = {jermajesty => 100000, 
                  chip => 90000,
                  inigo => 120000,
                  tyler => 85000}
      expect(budget.employee_salaries).to eq(expected)
    end
  end

  describe '#all_employees' do 
    it 'is a list of all employees' do 
      tech_support.hire(jermajesty) 
      tech_support.hire(chip)
      customer_service.hire(inigo)
      customer_service.hire(tyler)

      tech_support.expense(600)
      customer_service.expense(200)

      budget.add_department(customer_service)
      budget.add_department(tech_support)

      expect(budget.all_employees).to match_array([jermajesty, chip, inigo, tyler])
    end
  end

  describe '#department_expense_log' do 
    it 'tracks the departments expenses and employees responsible' do 
      tech_support.hire(jermajesty) 
      tech_support.hire(chip)
      customer_service.hire(inigo)
      customer_service.hire(tyler) 

      budget.add_department(customer_service)
      budget.add_department(tech_support) 

      jermajesty.expends(20)
      chip.expends(15)
      inigo.expends(10)
      tyler.expends(35)

      expected_1 = {
                    jermajesty => 20, 
                    chip => 15
      }

      expect(tech_support.employee_total_expenses).to eq(expected_1)

       expected_2 = {
                    inigo => 10, 
                    tyler => 35
      }

      expect(customer_service.employee_total_expenses).to eq(expected_2)

      expect(tech_support.department_track_expenses).to eq(35)
      expect(tech_support.expenses).to eq(35)
      expect(customer_service.department_track_expenses).to eq(45)
      expect(customer_service.expenses).to eq(45)

      expected_log = { 
                        tech_support => {:department_employee_expenses => expected_1, :deparment_total_expenses => 35},
                        customer_service => {:department_employee_expenses => expected_2, :deparment_total_expenses => 45}
      }

      expect(budget.department_expense_log).to eq(expected_log)
    end
  end

end