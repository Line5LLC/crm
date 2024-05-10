module PaperclipLocalUrl
  # When using local file storage, returns the full path. Otherwise returns the
  # normal url.
  def self.url(attachment)
    if attachment.blank?
      nil
    elsif attachment.options[:storage] == :filesystem
      attachment.path
    else
      attachment.url
    end
  end
end
