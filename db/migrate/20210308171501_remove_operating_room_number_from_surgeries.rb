class RemoveOperatingRoomNumberFromSurgeries < ActiveRecord::Migration[5.2]
  def change
    remove_column :surgeries, :operating_room_numer, :integer
  end
end
