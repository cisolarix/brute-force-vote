class Ip < ActiveRecord::Base
  scope :prioritized, proc {
    order(diff: :desc)
  }

  after_save :touch_diff

  private

  def touch_diff
    update_column(:diff, success_count - failed_count)
  end
end
