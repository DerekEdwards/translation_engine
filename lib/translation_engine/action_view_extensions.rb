module ActionViewExtensions

  extend ActiveSupport::Concern

  def translate_helper_translate(key_param)
    begin
      translation_key_id = TranslationKey.where("name = ?",key_param).first.id
      locale_id = Locale.where("name = ?",I18n.locale).first.id
      translation_records = Translation.where("translation_key_id = ? AND locale_id = ?", translation_key_id, locale_id)
      #should add a Honeybadger call if multiple records returned.
      translation_records.count > 0 ? translation_text = translation_records[0].value : translation_text = "Translation not found: key = #{key_param}"
      return translation_text
    rescue
      return "Translation not found: key = #{key_param}"
    end
  end

end