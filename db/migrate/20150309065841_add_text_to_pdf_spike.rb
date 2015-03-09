class AddTextToPdfSpike < ActiveRecord::Migration
  def change
    add_column :pdf_spikes, :text, :string
  end
end
