class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.float :amount
      t.string :cardType
      t.string :amountReceived

      t.timestamps null: false
    end
  end
end
