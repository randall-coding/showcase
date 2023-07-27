ActiveAdmin.register PortfolioItem do
  permit_params :css_class, :title, :logo, :url, :description, :image_url, :position, :image
  
  #show
  show do
    attributes_table do
      row :css_class
      row :title
      row :logo
      row :url
      row :position
      row :description
      row :image do |portfolio_item|
        if portfolio_item.image.attached?
          # Display the image using image_tag helper
          image_tag portfolio_item.image, style: "width:200px"
        else
          "No image available"
        end
      end
    end
    active_admin_comments # If you want to display comments section
  end

  #edit 
  form do |f|
    f.inputs do
      f.input :css_class
      f.input :title
      f.input :logo
      f.input :url
      f.input :description
      f.input :position
      if f.object.image.attached?
        # Display the existing image preview
        f.input :image, as: :file, hint: image_tag(f.object.image, style:"width:200px")
      else
        f.input :image, as: :file
      end    end
    f.actions
  end
end
