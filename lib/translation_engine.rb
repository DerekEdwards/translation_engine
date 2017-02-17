require "translation_engine/version"
require 'translation_engine/action_view_extensions'

#refactor these includes at some point, if possible
#require 'tasks/database_tasks'
require 'tasks/install'
require 'tasks/load'

module TranslationEngine

  class Engine < ::Rails::Engine

    engine_name 'translation_engine'
    
  end

  def self.translate(locale_param, key_param, options={})
    puts "locale_param"
    puts locale_param
    puts "key_param"
    puts key_param
    puts "options"
    puts options



    locale = Locale.find_by(name: locale_param)
    unless locale
      return "missing locale #{locale_param}"
    end
    key = TranslationKey.find_by(name: key)
    unless key
      return "missing key #{key_param}"
    end

    translation = Translation.find_by(locale: locale, key: key)
    return translation.nil? ? 'translation missing #{locale.name}:#{key.name}' : translation.value 
    #Translation.find_by(locale: locale.find_by(name: locale))
    #return self.translate_text(key_param, *interpolations)
  end

end

#Include as view helper
ActionView::Base.send :include, ActionViewExtensions