class AddContentToPdfSpike < ActiveRecord::Migration
  def change
    add_column :pdf_spikes, :content, :text
  end
end
