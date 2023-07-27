class AddUserReferenceToUserblog < ActiveRecord::Migration[7.0]
  def change
    add_reference :userblogs, :user, foreign_key: true
  end
end
