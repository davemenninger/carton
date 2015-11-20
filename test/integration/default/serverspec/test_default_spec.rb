require 'serverspec'

# required by serverspec
set :backend, :exec

platform = host_inventory['platform']

describe 'Plackup Daemon' do
  it 'is listening on port 5000' do
    expect(port(5000)).to be_listening
  end

  # TODO: this platform dependent stuff seems hacky
  if %w(debian ubuntu).include?(platform)
    puts 'detected debian/ubuntu'
    it 'has a running service of plack' do
      expect(service('plackup')).to be_running
    end
  elsif platform == 'redhat'
    puts 'detected redhat ( or centos )'
    describe command('/sbin/service hello-world status') do
      re = /.*run: hello-world: */
      its(:stdout) { should match re }
    end
  else
    puts "#{platform} not debian ubuntu or redhat. not checking service running"
    fail
  end

  describe command('curl localhost:5000') do
    re = /.*Hello, world!*/
    its(:stdout) { should match re }
  end
end
