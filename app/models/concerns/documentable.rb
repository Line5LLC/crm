module Documentable
  extend ActiveSupport::Concern

  def file_url
    PaperclipLocalUrl.url(file)
  end
end
