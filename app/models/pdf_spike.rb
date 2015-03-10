require 'elasticsearch/model'

class PdfSpike < ActiveRecord::Base
  mount_uploader :text, TextUploader
   include Elasticsearch::Model
   include Elasticsearch::Model::Callbacks

  settings index: { number_of_shards: 1 } do
    mappings dynamic: 'true' do
      indexes :title, analyzer: 'english'
      indexes :attachment, type: 'attachment'
    end
  end
  def attachment
    path_to_attachment = text.file.file
    Base64.encode64(open(path_to_attachment) { |file| file.read })
  end

  def as_indexed_json(options = {})
    self.as_json(methods: [:attachment])
  end

end


PdfSpike.import