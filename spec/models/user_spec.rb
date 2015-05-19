require 'rails_helper'

RSpec.describe User, type: :model do
  it "shoud get all info in hash" do
    @universities = {
      cuc: '中国传媒大学',
      pku: '北京大学',
      thu: '清华大学',
      fdu: '复旦大学'
    }

    for k, v in @universities do
      University.create(name: v, short_name: k)
    end
  end
end
