class Employee
  attr_reader :name
  attr_accessor :title, :salary, :boss
  def initialize(name, title, salary, boss)
    @name = name
    @title = title
    @salary = salary
    @boss = boss
  end

  def bonus(multiplier)
    if self.class == Manager
      salaries = self.employees.inject(0) {|acc, emp| acc + emp.salary}
      salaries * multiplier
    else
      self.salary * multiplier
    end
  end
end

class Manager < Employee
  attr_accessor :employees
  def initialize(name, title, salary, boss, employees = [])
    @employees = employees
    super(name, title, salary, boss)
  end
end



ned = Manager.new('ned', 'founder', 1000000, nil)
darren = Manager.new('darren', 'TA Manager', 78000, ned)
shawna = Employee.new('shawna', 'TA', 12000, darren)
david = Employee.new('david', 'TA', 10000, darren)
darren.employees = [shawna, david]
ned.employees = [darren, darren.employees].flatten


p ned.bonus(5)
p darren.bonus(4)
p david.bonus(3)
p shawna.bonus(3)
