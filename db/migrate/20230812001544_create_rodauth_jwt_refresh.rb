class CreateRodauthJwtRefresh < ActiveRecord::Migration[7.0]
  def change
    # Used by the jwt refresh feature
    create_table :account_jwt_refresh_keys do |t|
      t.references :account, foreign_key: true, null: false
      t.string :key, null: false
      t.datetime :deadline, null: false
      t.index :account_id, name: "account_jwt_rk_account_id_idx"
    end
  end
end
