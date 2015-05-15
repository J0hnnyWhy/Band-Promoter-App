class Band < ActiveRecord::Base
  has_and_belongs_to_many(:venues)
  validates(:name, {:presence => true, :length => {:minimum => 2, :maximum => 50}})
  before_save(:upcase_name)


  scope(:not_done, -> do
    where({done=> false})
  end)

private


  define_method(:upcase_name) do
    self.name=(name().upcase())
  end
end
