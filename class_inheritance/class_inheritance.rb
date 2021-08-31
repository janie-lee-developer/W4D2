require "byebug"
class Employee
    attr_reader :name, :title, :salary
    attr_accessor :boss

    def initialize(name, title, salary, boss)
        @name = name
        @title = title
        @salary = salary
        @boss = boss
    end
    
    def boss=(boss)
    @boss = boss
    boss.add_employee(self) unless boss.nil?

    boss
  end

    def bonus(multiplier)
        bonus = (@salary) * multiplier
    end


end

class Manager < Employee
    attr_reader :employees
    def initialize(name, title, salary, boss)
        super
        @employees = []
    end

    def bonus(multiplier)
        total_salary = bfs
        bonus = total_salary * multiplier
    end

    def add_employee(employee_instance)
        @employees << employee_instance

        employee_instance
    end
        
    def bfs
        sum = 0 #daren_salary #shawna_salary
        queue = [self]  
        until queue.empty?
            node = queue.shift
            sum += node.salary unless node.boss.nil? 
            queue.concat(node.employees) if node.is_a?(Manager)
        end
        sum
     end
end

ned = Manager.new("Ned", "Founder", 1000000 , nil)
darren = Manager.new("Darren", "TA Manager", 78000, "Ned")
shawna = Employee.new("Shawna", "TA", 12000, "Darren")
david = Employee.new("David", "TA", 10000, "Darren")

ned.add_employee(darren)
darren.add_employee(shawna)
darren.add_employee(david)

p ned.bonus(5) # => 500_000
p darren.bonus(4) # => 88_000
p david.bonus(3) # => 30_000