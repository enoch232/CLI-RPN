class CreateRpnExpressions < ActiveRecord::Migration[5.1]
  def change
    create_table :rpn_expressions do |t|
      t.string :expression
      t.decimal :result

      t.timestamps
    end
  end
end
