class Venue < ActiveRecord::Base
  has_and_belongs_to_many(:bands)
  validates(:venue_name, {:presence => true, :length => {:minimum => 2, :maximum => 50}})
  before_save(:capitalize_name)

  scope(:not_done, -> do
    where({done=> false})
  end)

private


  define_method(:capitalize_name) do
    self.venue_name=venue_name().capitalize()
  end
end
