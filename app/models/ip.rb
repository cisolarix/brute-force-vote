class Ip < ActiveRecord::Base
  scope :available, proc {
    where(used: false)
  }

  scope :unavailable, proc {
    where(used: true)
  }
end
