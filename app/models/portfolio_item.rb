class PortfolioItem < ApplicationRecord
  LOGOS = ['rails','wordpress','matlab']
  CSS_CLASSES = ['rails','wordpress','matlab','ethereum','elite','framework', 'framework matlab']
  validates :logo, inclusion: {in: LOGOS}
  validates :css_class, inclusion: {in: CSS_CLASSES}
  validates :logo,:css_class,:title,:url,:description,
    presence:true

  default_scope { order('position ASC') }
  scope :title_ids, -> { pluck([:id,:title]) }

  def self.switch_ids(item1, item2)
    switcher_position = item2.position
    item2.position = item1.position
    item2.save!
    item1.position = switcher_position
    item1.save!
  end

  def change_position(new_position)
    new_index = new_position - 1
    all_items = PortfolioItem.where.not(id:self.id)
    all_items = all_items.to_a

    all_items.insert(new_index,self)
    all_items.each_with_index do |item, index|
      item.position = index + 1
      item.save!
    end
  end
end
