module Logs
  class Builder


    def initialize parent_type, parent_id
      @parent_type = parent_type
      @parent_id = parent_id
    end

    def build
      collection = []
      logs.each do |obj|
        collection.push complete_details(obj)
      end
      collection
    end

    private

    def complete_details obj
      {
        content: obj.content,
        created_at: obj.created_at
      }
    end

    protected

    def logs
      @logs ||= Log.where(parent_type: @parent_type, parent_id: @parent_id).order("id DESC")
    end

  end


end
