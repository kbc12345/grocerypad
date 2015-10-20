module Common
  extend ActiveSupport::Concern

  private

  def create_helper
    if @obj.save
      eval("Logs::#{parent_type}").new(current_user,@obj).publish_create_log
      render json: @obj
    else
      obj_errors
    end
  end

  def update_helper
    if @obj.update_attributes(obj_params)
      eval("Logs::#{parent_type}").new(current_user,@obj).publish_update_log
      render json: {success: true}
    else
      obj_errors
    end
  end

  def delete_helper
    if @obj.destroy
      eval("Logs::#{parent_type}").new(current_user,@obj).publish_delete_log
      render json: {success: true}
    end
  end

  def obj_errors
    render json: { message: 'Validation failed', errors: @obj.errors.full_messages }, status: 422
  end

  def parent_type
    @parent_type ||= params[:controller].split("/").last.titleize.delete(' ')
  end

end
