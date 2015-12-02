version = node['formatron_packetbeat']['version']

hostname = node['formatron_packetbeat']['logstash']['hostname']
port = node['formatron_packetbeat']['logstash']['port']

include_recipe 'formatron_beats::default'

package 'libpcap0.8'
package 'packetbeat' do
  version version
end

#template '/etc/packetbeat/packetbeat.yml' do
  #variables(
    #hostname: hostname,
    ##port: port
  #)
  #notifies :restart, 'service[topbeat]', :delayed
#end

service 'packetbeat' do
  supports status: true, restart: true, reload: false
  action [ :enable, :start ]
end
