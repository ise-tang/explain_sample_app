class CreateTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :tasks do |t|
      t.string :title
      t.datetime :due_at
      t.references :member, null: false, foreign_key: true

      t.timestamps
    end
  end
end
