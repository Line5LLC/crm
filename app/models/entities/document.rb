# == Schema Information
#
# Table name: documents
#
#  id                    :bigint           not null, primary key
#  documentable_type     :string
#  file_content_type     :string           not null
#  file_file_name        :string           not null
#  file_file_size        :integer
#  file_updated_at       :datetime         not null
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#  documentable_id       :bigint
#  encrypted_document_id :integer
#
# Indexes
#
#  index_documents_on_documentable_type_and_documentable_id  (documentable_type,documentable_id)
#


class Document < CrmSchema
  self.table_name = "documents"

  URL_EXPIRATION_TIME = 86400

  include Documentable

  belongs_to :documentable, polymorphic: true

  has_attached_file :file, :styles => {}
  do_not_validate_attachment_file_type :file

  validates :file_file_name, uniqueness: true, presence: true
  validates :document_name, presence: true
  validates :document_type, presence: true

  def generate_link
    s3_client = Aws::S3::Client.new(region: ENV['AWS_REGION'], access_key_id: ENV['AWS_ACCESS_KEY_ID'], secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'])

    resource = Aws::S3::Resource.new(client: s3_client)

    file_path = file.path[/(?=documents).*/]

    object = resource.bucket(ENV['AWS_BUCKET']).object("#{file_path}")
    signer = Aws::S3::Presigner.new(client: s3_client)
    signer.presigned_url(:get_object, bucket: ENV['AWS_BUCKET'], key: object.key, expires_in: URL_EXPIRATION_TIME)
  end

  def file_url
    PaperclipLocalUrl.url(file)
  end
end
