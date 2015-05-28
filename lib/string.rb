class String
  def remove_html_tag!
    self.gsub(/<[^>]*>/, '')
  end
end