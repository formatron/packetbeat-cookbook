version = node['formatron_packetbeat']['version']

enabled = node['formatron_packetbeat']['enabled']

host = node['formatron_packetbeat']['logstash']['host']
port = node['formatron_packetbeat']['logstash']['port']

include_recipe 'formatron_beats::default'

package 'libpcap0.8'
package 'packetbeat' do
  version version
end

template '/etc/packetbeat/packetbeat.yml' do
  variables(
    host: host,
    port: port
  )
  notifies :restart, 'service[packetbeat]', :delayed if enabled
end

service 'packetbeat' do
  supports status: true, restart: true, reload: false
  action [ :enable, :start ] if enabled
  action [ :disable, :stop ] unless enabled
end
