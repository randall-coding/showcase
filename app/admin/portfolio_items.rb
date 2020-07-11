ActiveAdmin.register PortfolioItem do
  permit_params :css_class, :title, :logo, :url, :description, :image_url, :position  
end
