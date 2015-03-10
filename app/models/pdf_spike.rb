require 'elasticsearch/model'
require 'pdf-reader'
class PdfSpike < ActiveRecord::Base
  after_create :parse_document
  mount_uploader :text, TextUploader
   include Elasticsearch::Model
   include Elasticsearch::Model::Callbacks

  settings index: { number_of_shards: 1 } do
    mappings dynamic: 'true' do
      indexes :title, analyzer: 'english'
      indexes :content, type: 'attachment'
    
    end
  end

  def parse_document
    reader = PDF::Reader.new(text.file.file)
    content_array = []
    reader.pages.each do |page|
      content_array << page.text
    end
    self.content = content_array.join(' ')
    self.save
  end

  def as_indexed_json(options = {})
    self.as_json(methods: [:attachment])
  end

end


PdfSpike.import