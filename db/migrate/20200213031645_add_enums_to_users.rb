# frozen_string_literal: true

class AddEnumsToUsers < ActiveRecord::Migration[6.0]
  def up
    execute <<-SQL
      CREATE TYPE user_gender AS ENUM ('female', 'male', 'other');
      CREATE TYPE user_role  AS ENUM ('member', 'interviewer');
    SQL
    add_column :users, :gender, :user_gender
    add_column :users, :role, :user_role
  end

  def down
    remove_column :users, :gender
    remove_column :users, :role
    execute <<-SQL
      DROP TYPE user_gender;
      DROP TYPE user_role;
    SQL
  end
end
