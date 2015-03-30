class Boss < ActiveRecord::Base
  def self.employees_for(id)
    ret = Array.new

    Boss.where(boss_id: id).each do |r|
      ret.push User.find(r[:employee_id])
    end

    ret
  end

  def self.employees_for_select(id)
    ret = Array.new

    Boss.where(boss_id: id).each do |r|
      u = User.find(r[:employee_id])
      o = [ u.name, u.id ]
      ret.push o
    end

    ret
  end

  def self.bosses_for(id)
    ret = Array.new

    Boss.where(employee_id: id).each do |r|
      ret.push User.find(r[:boss_id])
    end

    ret
  end

  def self.set_employees(id, employees)
    Boss.delete_all("boss_id = #{id}")

    employees.each do |employee_id|
      record = { boss_id: id, employee_id: employee_id }
      b = Boss.new record
      b.save
    end
  end
end
