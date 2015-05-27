class College < ActiveRecord::Base
  belongs_to :university
  has_many :majors
  has_many :users

  #validates :short_name, uniqueness: true, presence: true, format: { with: /\A[a-zA-Z]+\z/, message: "只能用英文字符"}
  #validates :name, presence: true, uniqueness: true

  def to_params
    self.short_name
  end
end
