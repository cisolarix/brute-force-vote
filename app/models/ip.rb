class Ip < ActiveRecord::Base
  scope :unavailable, proc {
    where('failed_count >= 10 AND success_count < failed_count')
  }
end
