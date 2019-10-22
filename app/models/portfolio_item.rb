class PortfolioItem < ApplicationRecord
  LOGOS = ['rails','wordpress','matlab']
  CSS_CLASSES = ['rails','wordpress','matlab','ethereum','elite','framework', 'framework matlab']
  validates :logo, inclusion: {in: LOGOS}
  validates :css_class, inclusion: {in: CSS_CLASSES}
  validates :logo,:css_class,:title,:url,:description,
    presence:true

  default_scope { order('id ASC') }
  scope :title_ids, -> { pluck([:id,:title]) }
  # TODO class logic
end
