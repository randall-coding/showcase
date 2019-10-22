class CreatePortfolioItems < ActiveRecord::Migration[5.2]
  def change
    create_table :portfolio_items do |t|
      t.string :css_class
      t.string :title
      t.string :logo
      t.string :url
      t.string :description

      t.timestamps
    end
  end
end
