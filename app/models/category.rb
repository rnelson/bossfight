class Category < ActiveRecord::Base

  def self.all_for_select
    ret = Array.new

    Category.all.each do |c|
      o = [ c.name, c.id ]
      ret.push o
    end

    ret
  end
end
