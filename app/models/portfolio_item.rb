class PortfolioItem < ApplicationRecord
  LOGOS = ['rails','wordpress','matlab']
  CSS_CLASSES = ['rails','wordpress','matlab','ethereum','elite','framework', 'framework matlab']
  validates :logo, inclusion: {in: LOGOS}
  validates :css_class, inclusion: {in: CSS_CLASSES}
  validates :logo,:css_class,:title,:url,:description,
    presence:true

  default_scope { order('id ASC') }
  scope :title_ids, -> { pluck([:id,:title]) }

  def self.switch_ids(item1, item2)
    switcher_id = item2.id
    item2.id = item1.id
    item1.id = PortfolioItem.last.id + 1
    item1.save!

    item2.save!
    item1.id = switcher_id
    item1.save!
  end
end
