require 'serverspec'

# required by serverspec
set :backend, :exec

describe 'Plackup Daemon' do
  it 'is listening on port 5000' do
    expect(port(5000)).to be_listening
  end

  it 'has a running service of plack' do
    expect(service('plackup')).to be_running
  end

  describe command('curl localhost:5000') do
    re = /.*Hello, world!*/
    its(:stdout) { should match re }
  end
end
