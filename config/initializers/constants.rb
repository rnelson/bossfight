class Constants
  def self.access_level
    {
      :user => {
        :id => 0,
        :name => 'User'
      },
      :admin => {
        :id => 1,
        :name => 'Admin'
      }
    }
  end

  def self.status
    {
      :deleted => {
        :id => -1,
        :name => 'Deleted',
        :css => 'deleted'
      },
      :new => {
        :id => 1,
        :name => 'New',
        :css => 'new'
      },
      :in_progress => {
        :id => 2,
        :name => 'In Progress',
        :css => 'in-progress'
      },
      :done => {
        :id => 3,
        :name => 'Done',
        :css => 'done'
      },
      :stalled => {
        :id => 4,
        :name => 'Stalled',
        :css => 'stalled'
      }
    }
  end

  def self.statuses
    ret = Array.new

    Constants.status.each do |k, v|
      o = { id: v[:id], name: v[:name] }
      o = [ v[:name], v[:id] ]
      ret.push o
    end

    ret
  end

  def self.access_levels
    ret = Array.new

    Constants.access_level.each do |k, v|
      o = { id: v[:id], name: v[:name] }
      o = [ v[:name], v[:id] ]
      ret.push o
    end

    ret
  end

  def self.deleted
    self.status[:deleted][:id]
  end
  def self.new
    self.status[:new][:id]
  end
  def self.updated
    self.status[:updated][:id]
  end
  def self.in_progress
    self.status[:in_progress][:id]
  end
  def self.done
    self.status[:done][:id]
  end
  def self.stalled
    self.status[:stalled][:id]
  end



  def self.get_status_id(s)
    self.status[s.to_sym][:id]
  end
  def self.get_status_name(s)
    self.status[s.to_sym][:name]
  end
  def self.get_status_name_by_id(id)
    Constants.status.each do |k, v|
      if v[:id] == id
        return v[:name]
      end
    end

    'Unknown'
  end
  def self.get_status_css_class_by_id(id)
    Constants.status.each do |k, v|
      if v[:id] == id
        return v[:css]
      end
    end

    ''
  end



  def self.get_access_id(s)
    self.access_level[s.to_sym][:id]
  end
  def self.get_access_name(s)
    self.access_level[s.to_sym][:name]
  end
  def self.get_access_name_by_id(id)
    Constants.access_level.each do |k, v|
      if v[:id] == id
        return v[:name]
      end
    end

    'Unknown'
  end
end