class AddImageToPortfolioItems < ActiveRecord::Migration[6.1]
  def change
    add_column :portfolio_items, :image, :string
    remove_column :portfolio_items, :image_url
  end
end
