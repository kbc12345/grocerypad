module Logs
  class Base
    include Logs::Common

    #
    # note: do not instantiate this class
    # note: this will only server as an abstract for all logger classes
    #
    COMMON_SKIPPED_KEYS = %w(
      updated_at
      created_at
      id
    )

    def initialize current_user, obj
      @current_user = current_user
      @obj = obj
    end

    #
    # Common logic for creating a "added by" log
    #
    def publish_create_log
      Log.create(parent_id: parent_id,
      content: generate_create_content,
      parent_type: parent_type,
      user_id: @creator_id)
    end


    #
    # Common logic for creating a "updated by" log
    # note: this is not create because usually updates have multiple entries
    # note: must be mass inserted
    #
    def publish_update_log
      logs = []
      @obj.previous_changes.each do |key,value|
        next if COMMON_SKIPPED_KEYS.include?(key) || is_key_skipped?(key)
        logs.push initialize_update_obj(key,value)
      end
      Log.import logs
      true
    end


    #
    # Common logic for creating a "deleted by" log
    #
    def publish_delete_log
      Log.create(parent_id: parent_id,
      content: generate_delete_content,
      parent_type: parent_type,
      user_id: @creator_id)
    end


    #
    # Default parent id
    #
    def parent_id
      @obj.id
    end

    #
    # Default parent id
    #
    def parent_type
      self.class.name.demodulize.singularize
    end

    private

    def initialize_update_obj key, value
      Log.new(parent_id: parent_id,
      content: generate_update_content(key,value),
      parent_type: parent_type,
      user_id: @current_user.id)
    end

  end
end
