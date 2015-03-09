class AddDetailToPdfSpike < ActiveRecord::Migration
  def change
    add_column :pdf_spikes, :detail, :text
  end
end
