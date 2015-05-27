class Major < ActiveRecord::Base
  belongs_to :college
  belongs_to :discipline
  has_many :users

  def category
    SecondGradeDiscipline.find(self.second_grade_discipline_id).category
  end
end
