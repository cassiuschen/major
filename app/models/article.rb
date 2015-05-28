class Article < ActiveRecord::Base
  include ActionView::Helpers
  belongs_to :user

  def text_content
    self.content.remove_html_tag!
  end

  def preview
    truncate(self.text_content, length: 100, truncate_string: "...")
  end
end
