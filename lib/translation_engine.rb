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

  def self.translate(locale, key, options={})
    return 'derek 2'

    #Translation.find_by(locale: locale.find_by(name: locale))
    #return self.translate_text(key_param, *interpolations)
  end

end

#Include as view helper
ActionView::Base.send :include, ActionViewExtensions