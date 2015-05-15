class CreateTables < ActiveRecord::Migration
  def change
    create_table(:bands) do |t|
      t.column(:name, :string)
      t.timestamps()
    end
    create_table(:venues) do |t|
      t.column(:venue_name, :string)
      t.timestamps()
    end
    create_table(:bands_venues) do |t|
      t.column(:band_id, :integer)
      t.column(:venue_id, :integer)
    end
  end
end
