class CreateUser < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :iden
      t.string :email
    end
  end

  def self.down
    drop_table :users
  end
end