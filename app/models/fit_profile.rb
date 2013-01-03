class FitProfile < ActiveRecord::Base
  belongs_to :pant

  SIZES = [0, 2, 4, 6, 8, 10, 12, 14, 16, 18, 20]

  validates :size, :inclusion => { :in => SIZES,
    :message => "%{value} is not a valid size" }
end
