ActiveRecord::Schema.define :version => 0.1 do  
  create_table :alarms do |t|
    t.string :name
    t.text :description
    t.string :alarmable_type
    t.integer :alarmable_id
    t.datetime :set_at
    t.datetime :repeat_at
    t.datetime :inactivated_at
    t.string :alarmer_type
    t.integer :alarmer_id

    t.timestamps
  end
  add_index :alarms, [:alarmable_type, :alarmable_id]
  add_index :alarms, [:alarmer_type, :alarmer_id]

  
  create_table :alarmables, :force => true do |t|
    t.column :name, :string
    # t.column :type, :string
  end
  # 
  # create_table :unalarmable_alarmables, :force => true do |t|
  #   t.column :alarmable_alarmable_id, :integer
  #   t.column :name, :string
  # end
  # 
  # create_table :cached_alarmables, :force => true do |t|
  #   t.column :name, :string
  #   t.column :type, :string
  #   t.column :cached_tag_list, :string
  # end
  
  create_table :alarmers, :force => true do |t|
    t.column :name, :string
  end
  # 
  # create_table :other_alarmable_alarmables, :force => true do |t|
  #   t.column :name, :string
  #   t.column :type, :string
  # end
end
