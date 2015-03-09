class CreatePdfSpikes < ActiveRecord::Migration
  def change
    create_table :pdf_spikes do |t|

      t.timestamps null: false
    end
  end
end
