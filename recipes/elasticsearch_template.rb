formatron_elasticsearch_template 'packetbeat' do
  template JSON.parse(File.read('/etc/packetbeat/packetbeat.template.json'))
end
