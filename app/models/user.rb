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
    !!(self.sexal && self.avatar)
  end

  def major_info
    m = Major.find self.major_id
    c = College.find m.college_id
    u = University.find c.university_id
    "#{u.name} - #{c.name} - #{m.name}"
  end

  def avatar_img
    if self.avatar
      self.avatar.path 
    else
      "avatar/#{self.sexal}.jpg"
    end
  end

  def article_count
    if self.articles
      self.articles.to_a.size
    else
      0
    end
  end
  
end
