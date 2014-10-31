class Article < ActiveRecord::Base
  has_attached_file :photo, :styles => { :medium => "600x600>" }
  has_many :comments, dependent: :destroy
  validates_attachment_size :photo, :less_than => 10.megabytes
  validates_attachment_content_type :photo, :content_type => /\Aimage/
  validates_attachment_file_name :photo, :matches => [/png\Z/, /jpe?g\Z/]
  validates :title, presence: true,
  length: { minimum: 2 }
  validates :text, presence: true

end
