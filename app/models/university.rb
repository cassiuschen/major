class University < ActiveRecord::Base
  has_many :colleges
  has_many :users
  validates :short_name, uniqueness: true, presence: true, format: { with: /\A[a-zA-Z]+\z/, message: "只能用英文字符"}
  validates :name, presence: true, uniqueness: true

  def to_params
    self.short_name
  end

  def self.all_as_hash
    @result = {}
    self.all.each do |c|
      @result[c.short_name.to_sym] = c.name
    end
    @result
  end
end
