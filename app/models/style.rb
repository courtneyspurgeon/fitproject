class Style < ActiveRecord::Base
  has_many :pants

  STATUSES = [
    :skinny,
    :boot_cut,
    :straight,
    :relaxed_fit
  ]

end
