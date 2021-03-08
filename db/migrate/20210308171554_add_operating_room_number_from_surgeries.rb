class AddOperatingRoomNumberFromSurgeries < ActiveRecord::Migration[5.2]
  def change
    add_column :surgeries, :operating_room_number, :integer
  end
end
