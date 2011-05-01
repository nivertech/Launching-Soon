class CreatePeople < ActiveRecord::Migration
  def self.up
    create_table :people do |t|
      t.string   :name
      t.string   :email
      t.string   :referral_code
      t.integer  :referred_by
      t.datetime :created_at
    end
  end

  def self.down
    drop_table :people
  end
end
