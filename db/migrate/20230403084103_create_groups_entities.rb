# frozen_string_literal: true

class CreateGroupsEntities < ActiveRecord::Migration[7.0]
  def change
    create_table :groups_entities do |t|
      t.references :group, foreign_key: true
      t.references :entity, foreign_key: true

      t.timestamps
    end
    add_index :groups_entities, [:group_id, :entity_id]
  end
end
