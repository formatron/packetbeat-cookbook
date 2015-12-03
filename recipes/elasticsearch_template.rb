formatron_elasticsearch_template 'packetbeat' do
  template JSON.parse(File.read('/etc/packetbeat/packetbeati.template.json'))
end
