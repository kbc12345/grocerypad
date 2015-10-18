module Common
  extend ActiveSupport::Concern

  private

  def create_helper
    if @obj.save
      render json: @obj
    else
      obj_errors
    end
  end

  def update_helper
    if @obj.update_attributes(obj_params)
      render json: {success: true}
    else
      obj_errors
    end
  end

  def delete_helper
    if @obj.destroy
      render json: {success: true}
    end
  end

  def obj_errors
    render json: { message: 'Validation failed', errors: @obj.errors.full_messages }, status: 422
  end

end
