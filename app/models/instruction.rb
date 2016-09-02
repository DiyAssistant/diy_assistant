class Instruction < ActiveRecord::Base
  include PgSearch
  include WithUserAssociationExtension
  extend FriendlyId

  friendly_id :title, use: :slugged
  validates :title, uniqueness: true


  pg_search_scope :search_all,
  :against => [:title, :description],
  :using => {:tsearch => {:any_word => true, :dictionary => "english"}}

  belongs_to :user
  belongs_to :category
  has_many :likes, -> { extending WithUserAssociationExtension },
            dependent: :destroy

  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end
