class Train < ActiveRecord::Base
  def label
    if self.status == "delayed"
      return "notice"
    elsif self.status == "not running"
      return "warning" 
    else
      return "fine"
    end
  end
end
