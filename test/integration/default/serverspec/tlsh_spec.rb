require 'serverspec'

# Required by serverspec
set :backend, :exec

## Use Junit formatter output, supported by jenkins
#require 'yarjuf'
#RSpec.configure do |c|
#    c.formatter = 'JUnit'
#end

describe file('/opt/tools/tlsh/lib/libtlsh.a') do
  it { should be_readable }
end

describe file('/opt/tools/tlsh/lib/libtlsh.so') do
  it { should be_readable }
end

describe file('/usr/local/lib/python2.7/dist-packages/tlsh.so'), :if => os[:family] == 'debian' do
  it { should be_readable }
end
describe file('/usr/local/lib/python2.7/dist-packages/tlsh.so'), :if => os[:family] == 'ubuntu' && os[:release] == '12.04' do
  it { should be_readable }
end
describe file('/usr/local/lib/python3.4/dist-packages/tlsh.cpython-34m-x86_64-linux-gnu.so'), :if => os[:family] == 'ubuntu' && os[:release] == '14.04' do
  it { should be_readable }
end
describe file('/usr/local/lib/python3.5/dist-packages/tlsh.cpython-35m-x86_64-linux-gnu.so'), :if => os[:family] == 'ubuntu' && os[:release] == '16.04' do
  it { should be_readable }
end
describe file('/usr/local/lib/python3.6/dist-packages/tlsh.cpython-36m-x86_64-linux-gnu.so'), :if => os[:family] == 'ubuntu' && os[:release] == '18.04' do
  it { should be_readable }
end
describe file('/usr/lib64/python2.7/site-packages/tlsh.so'), :if => os[:family] == 'redhat' && os[:release] == '6' do
  it { should be_readable }
end
describe file('/usr/lib64/python3.4/site-packages/tlsh.cpython-34m.so'), :if => os[:family] == 'redhat' && os[:release] == '7' do
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

describe command('/opt/tools/tlsh/Testing/test.sh -xlen') do
  its(:stdout) { should match /passed/ }
  its(:stdout) { should match /passed all example data tests/ }
  its(:exit_status) { should eq 0 }
end

describe command('/opt/tools/tlsh/Testing/python_test.sh'), :if => os[:family] == 'ubuntu' && os[:release] == '12.04' do
  its(:stdout) { should match /passed/ }
  its(:exit_status) { should eq 0 }
end
describe command('/opt/tools/tlsh/Testing/python_test.sh python3'), :if => os[:family] == 'ubuntu' && os[:release] == '18.04' do
  its(:stdout) { should match /passed/ }
  its(:exit_status) { should eq 0 }
end
describe command('/opt/tools/tlsh/Testing/python_test.sh python3.4'), :if => (os[:family] == 'redhat' || os[:family] == 'centos') && os[:release] == '7' do
  its(:stdout) { should match /passed/ }
  its(:exit_status) { should eq 0 }
end

