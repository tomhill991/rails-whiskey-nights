class AddForeignKeysNew < ActiveRecord::Migration[5.2]
  def change
    add_reference :doses, :ingredient, foreign_key: true
    add_reference :doses, :cocktail, foreign_key: true
    add_reference :cocktails, :menu, foreign_key: true
    add_reference :menus, :bar, foreign_key: true
  end
end
