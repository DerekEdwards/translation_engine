class TranslationKey < ActiveRecord::Base

  has_many :translations, :dependent => :delete_all

  self.primary_key = :id 
  validates :name, length: { maximum: 255 }

end