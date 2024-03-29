class Pant < ActiveRecord::Base
  has_many :fit_profiles

  belongs_to :brand

  STYLES = [
    'skinny',
    'boot_cut',
    'straight',
    'relaxed_fit'
  ]

  validates :name, :style, :brand_id, :presence => true
  validates :style, :inclusion => { :in => STYLES,
    :message => "%{value} is not a valid style" }

  

end
