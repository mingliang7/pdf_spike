class AddTitleToPdfSpike < ActiveRecord::Migration
  def change
    add_column :pdf_spikes, :title, :string
  end
end
