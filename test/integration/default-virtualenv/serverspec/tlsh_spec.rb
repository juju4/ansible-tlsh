require 'serverspec'

# Required by serverspec
set :backend, :exec

## Use Junit formatter output, supported by jenkins
#require 'yarjuf'
#RSpec.configure do |c|
#    c.formatter = 'JUnit'
#end

describe file('/opt/tools/tlsh/lib/libtlsh.so') do
  it { should be_readable }
end

describe file('/home/test/env/lib/python2.7/site-packages/tlsh.so') do
  it { should be_readable }
end

describe command('/opt/tools/tlsh/bin/tlsh_version') do
  its(:stdout) { should match /buckets hash/ }
  its(:exit_status) { should eq 0 }
end
describe command('/opt/tools/tlsh/Testing/test.sh') do
  its(:stdout) { should match /passed/ }
  its(:exit_status) { should eq 0 }
end
## test only subdir install
#describe command('/opt/tools/tlsh/Testing/python_test.sh') do
#  its(:stdout) { should match /passed/ }
#  its(:exit_status) { should eq 0 }
#end
