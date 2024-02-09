class Kitten < ApplicationRecord
  def 
    self.cuteness_values
    ['adorable', 'average', 'extremely cute']
  end
  
  def
    self.softness_values 
    ['average', 'fluffy', 'very fluffy']
  end
  
  validates :cuteness, :inclusion => cuteness_values
  validates :softness, :inclusion => softness_values
  validates :age, :numericality => { :greater_than_or_equal_to => 0 }

end
