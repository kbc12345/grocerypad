class Log < ActiveRecord::Base

    belongs_to :product, class_name: "Product", foreign_key: "parent_id"

end