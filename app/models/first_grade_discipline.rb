class FirstGradeDiscipline < ActiveRecord::Base
  belongs_to :category
  has_many :second_grade_disciplines

  def category
  	Category.find(self.category_id).name
  end
end
