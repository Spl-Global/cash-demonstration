class CreateCashTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :cash_transactions do |t|
      t.float :initial_cash
      t.float :cash_in
      t.float :cash_out
      t.date :transaction_date
      t.references :company
      t.timestamps
    end
  end
end
