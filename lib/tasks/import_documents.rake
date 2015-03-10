namespace :import do
  desc 'Import all pdf docs in the folder specified'
  task :documents => :environment do |t, args|
    raise "Please supply the path to the documents. Usage: 'rake import:documents path=/home/darren/desktop/docs/'" if ENV['path'].nil?
    # files = Dir.entries("#{ENV['path']}")
    Dir.foreach("#{ENV['path']}") do |file_path|
      pdf = File.extname file_path
      if pdf == ".pdf"
        File.open(File.basename(file_path)) do |f|
          PdfSpike.create!(:title => File.basename(file_path), :text => "#{f}")
        end
      end
    end
    # list all *.pdf docs in the folder
    # loop round all of the docs and run the PdfSpike.Create( .... ) in order to save the document to the filesystem, to postges and elasticsearch
  end
end