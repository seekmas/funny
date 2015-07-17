class AddPhotoToWorkGallery < ActiveRecord::Migration
  def up
    add_attachment :work_galleries, :photo
  end

  def down
    remove_attachment :work_galleries, :photo
  end
end
