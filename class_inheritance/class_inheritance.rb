class Employee
    attr_reader :name, :title, :salary, :boss

    def initialize(name, title, salary, boss)
        @name = name
        @title = title
        @salary = salary
        @boss = boss
    end

    def bonus(multiplier)
        bonus = (@salary) * multiplier
    end


end

class Manager < Employee
    def initialize
        @employees = [ ]
    end

    def bonus
        
        

    end

    private
    def bfs
        sum = 0

        nodes = [self]
        until nodes.empty?
            node = nodes.shift
            
            sum += self.salary if self.boss
            nodes.concat(node.employees)
        end
     end
end