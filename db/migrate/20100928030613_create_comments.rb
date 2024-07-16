# frozen_string_literal: true

class CreateComments < ActiveRecord::Migration[4.2]
  def self.up
    create_table :comments, force: true do |t|
      t.references :user, foreign_key: true
      t.references :lead, foreign_key: true
      t.references :commentable, polymorphic: true, index: true
      t.boolean :private, default: false
      t.string :title, default: ""
      t.text :comment
      t.timestamps null: false
    end
  end

  def self.down
    drop_table :comments
  end
end
