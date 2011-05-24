class AlarmItMigration < ActiveRecord::Migration
  def self.up
    create_table :alarms do |t|
      t.string :name
      t.text :description
      t.reference :alarmable, :polymorphic => true
      t.datetime :set_at
      t.datetime :repeat_at
      t.datetime :inactivated_at
      t.reference :alarmer, :polymorphic => true

      t.timestamps
    end
    add_index :alarms, [:alarmable_type, :alarmable_id]
    add_index :alarms, [:alarmer_type, :alarmer_id]
  end

  def self.down
    drop_table :alarms
  end
end
