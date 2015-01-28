class Assignment < ActiveRecord::Base
  belongs_to :player
  belongs_to :battle

end
