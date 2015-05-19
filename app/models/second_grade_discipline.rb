class SecondGradeDiscipline < ActiveRecord::Base
  belongs_to :first_grade_discipline
  has_many :majors

  def category
  	FirstGradeDiscipline.find(self.first_grade_discipline_id).category
  end
end
