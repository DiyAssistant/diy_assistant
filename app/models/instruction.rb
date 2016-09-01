class Instruction < ActiveRecord::Base
  include PgSearch

  pg_search_scope :search_all,
  :against => [:title, :description],
  :using => {:tsearch => {:any_word => true, :dictionary => "english"}}

  belongs_to :user
  belongs_to :category

  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end
