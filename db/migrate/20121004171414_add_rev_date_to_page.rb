class AddRevDateToPage < ActiveRecord::Migration
  def change
    add_column :pages, :rev_date, :datetime
  end
end
