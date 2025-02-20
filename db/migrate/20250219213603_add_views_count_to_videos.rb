class AddViewsCountToVideos < ActiveRecord::Migration[7.2]
  def change
    add_column :videos, :views_count, :integer
    add_column :videos, :default, :string
   # add_column :videos, :0, :string
  end
end
