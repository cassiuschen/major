class University < ActiveRecord::Base
  has_many :colleges

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
