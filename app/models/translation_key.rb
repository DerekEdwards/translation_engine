class TranslationKey < ActiveRecord::Base

  self.primary_key = :id 
  validates :name, length: { maximum: 255 }

end