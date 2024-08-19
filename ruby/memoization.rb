
class SalaryCalculator
  def initialize employee
    @employee = employee
  end

  def calculate
    sleep 5

    case @employee.get_name
    when 'Pavel' then 10_000
    when 'Elena' then 20_000
    end
  end
end


class Employee
  def initialize name
    @name   = name
    @salary = { }
  end

  def get_name
    @name
  end

  private
  def get_salary
    @salary[:result] ||= SalaryCalculator.new(self).calculate
  end

  public
  def salary_per_hour
    get_salary / (365 * 8)
  end

  def salary_per_month
    get_salary / 12
  end
end

