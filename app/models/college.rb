class College < ActiveRecord::Base
  belongs_to :university
  has_many :majors

  def to_params
    self.short_name
  end
end
