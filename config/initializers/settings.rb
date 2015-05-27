class Settings < Settingslogic
  source "#{Rails.root}/config/settings.yml"
  namespace Rails.env
end

class BillBoard < Settingslogic
  source "#{Rails.root}/config/billboard.yml"
  namespace Rails.env
end