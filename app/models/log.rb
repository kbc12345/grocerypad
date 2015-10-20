class Log < ActiveRecord::Base

  belongs_to :product, class_name: "Product", foreign_key: "parent_id"


    #
    # returns the complete details of the file including the creators's name
    # note: creator must exists
    #
    def self.complete_details
      select("logs.*,
      CONCAT_WS(' ',users.first_name ,users.last_name) as creator_name").
      joins("inner join users on users.id = logs.user_id")
    end

end
