class Instruction < ActiveRecord::Base
  include PgSearch

  pg_search_scope :search_all,
  :against => [:title, :description],
  :using => {:tsearch => {:any_word => true, :dictionary => "english"}}

  belongs_to :user
end
