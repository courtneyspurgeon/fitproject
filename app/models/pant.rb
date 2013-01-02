class Pant < ActiveRecord::Base
  has_many :fit_profiles
  
  has_one :style
  has_one :brand 
end
