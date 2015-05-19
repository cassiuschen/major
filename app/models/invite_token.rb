class InviteToken < ActiveRecord::Base
  def can_use?
    !!(self.limit > 0)
  end

  def use!
    self.limit -= 1
    self.save
  end

  def self.available?(token)
    !!(self.where(token: token).size > 0)
  end

  def self.can_use?(token)
    !!(self.where(token: token).first.can_use?)
  end

  def self.use(token)
    !!(self.where(token: token).first.use!)
  end
end
