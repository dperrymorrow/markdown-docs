require 'markdown'
require 'coderay'
require 'nokogiri'

desc "parse the docs into the index.html output"
task :parse_docs do
  docs = File.read('docs.md')
  docs = Markdown.new(docs).to_html

  # doc = Nokogiri::HTML(docs)
  # doc.search("code").each do |code|
  #   code.replace CodeRay.scan(code.text.rstrip, :html).span
  # end

  # docs = doc.to_s

  template = File.read "template.html"
  output   = File.open "index.html", "w"
  output.write template.gsub('{{docs}}', docs)
end
