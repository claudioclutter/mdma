class Device < ActiveRecord::Base
  def short_name
    name.rpartition('-').first
  end
end
