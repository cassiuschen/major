class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  belongs_to :major
  has_many :articles
  has_one :contact

  enum role: {
    student: 0,
    stuff: 1,
    editor: 2,
    admin: 84
  }

  enum sexal: {
    unknown: 0,
    male: 1,
    girl: 2
  }

  def public?
    !!(self.public)
  end

  def can_donate?
    !!(self.alipay_account)
  end

  def has_major_info?
    !!(self.major_id)
  end

  def has_complete_info?
    !!(self.sexal)
  end
  
end
