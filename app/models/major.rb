class Major < ActiveRecord::Base
  belongs_to :college
  belongs_to :second_grade_discipline
  has_many :users

  def category
    SecondGradeDiscipline.find(self.second_grade_discipline_id).category
  end
end
