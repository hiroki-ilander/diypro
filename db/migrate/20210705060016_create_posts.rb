class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.string :finished_img
      t.text :introduction
      t.string :production_period
      t.text :material
      t.text :tool
      t.text :budget
      t.string :flow_caption1
      t.string :flow_img1
      t.text :flow_description1
      t.string :flow_caption2
      t.string :flow_img2
      t.text :flow_description2
      t.string :flow_caption3
      t.string :flow_img3
      t.text :flow_description3
      t.string :flow_caption4
      t.string :flow_img4
      t.text :flow_description4
      t.string :flow_caption5
      t.string :flow_img5
      t.text :flow_description5
      t.integer :user_id
      t.timestamps
    end
  end
end
