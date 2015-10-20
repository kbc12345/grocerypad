module Logs
  module Common

  # common methods used by the loggers
  # place common/helper/utils here to decluter the base class
  # note: do not instaniate this class

  #
  # default value
  # override this for fields to be skipped
  #
  def skipped_fields
    []
  end

  #
  # default value
  # override this for fields that needs date formatting
  #
  def date_fields
    []
  end

  private

  # NOTE: override these methods as they may differ per class
  # NOTE: all methods here are defacto default

  #
  # generates a created by string
  # note: this may differ per class
  #
  def generate_create_content
    "#{@current_user.full_name} added this entry"
  end

  #
  # generates an updated by string
  # note: get_label_value is in the instance class
  # note: as different logs have different value of columns per label
  #
  def generate_update_content key,value
    "#{@current_user.full_name} updated #{generate_update_text(key,value)}"
  end

  #
  # note: get label value should be overriden ALWAYS unlessyou want to use the default
  #
  def generate_update_text key,value
    if date_fields.present? && date_fields.include?(key)
      "#{get_label_value(key)} #{default_date_update_clause(value)}"
    else
      "#{get_label_value(key)} #{default_update_clause(value)}"
    end
  end

  #
  # Default update text
  #
  def default_update_clause value
    if value[0].present?
      "from #{value[0]} to #{value[1]}"
    else
      "to #{value[1]}"
    end
  end

  #
  # Default texct for date
  #
  def default_date_update_clause value
    old_date = value[0].try(:strftime, DATE_FORMAT)
    new_date = value[1].try(:strftime, DATE_FORMAT)
    if old_date.present?
      "from #{old_date} to #{new_date}"
    else
      "to #{new_date}"
    end
  end


  #
  # Default deleted text
  #
  def generate_delete_content
    "#{@creator_name} deleted this item"
  end

  #
  # Default label value
  #
  def get_label_value key
    key.sub("_", " ")
  end


  #
  # check if the key is skipped or not
  # note: skipped_fields can be blank
  #
  def is_key_skipped? key
    if skipped_fields.present? && skipped_fields.include?(key)
      true
    else
      false
    end
  end

  #
  # common pronoun
  #
  def origin_pronound verb
    verb == "deleted" ? "from" : "to"
  end

  end
end
