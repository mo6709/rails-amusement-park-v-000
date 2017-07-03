class CreateUsersTable < ActiveRecord::Migration
  def change
    create_table :users do |t|
    	t.string :name
    	t.string :password_digest
    	t.integer :happiness
    	t.integer :tickets
        t.integer :nausea
        t.integer :height
    	t.boolean :admin, :default => false
    end
  end
end