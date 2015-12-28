require 'spec_helper'

describe 'cmogstored' do
  describe file('/usr/local/bin/cmogstored') do
    it { should be_file }
    it { should be_mode 755 }
    it { should be_owned_by 'root' }
    it { should be_grouped_into 'root' }
  end

  describe group('mogile') do
    it { should have_gid 501 }
  end

  describe user('mogile') do
    it { should exist }
    it { should have_uid 501 }
    it { should belong_to_group 'mogile' }
  end

  describe file('/var/mogdata') do
    it { should be_directory }
    it { should be_owned_by 'mogile' }
    it { should be_grouped_into 'mogile' }
  end

  describe file('/etc/mogilefs') do
    it { should be_directory }
  end

  describe file('/etc/mogilefs/mogstored.conf') do
    it { should be_file }
  end

  describe file('/usr/local/lib/systemd/system') do
    it { should be_directory }
    it { should be_owned_by 'root' }
    it { should be_grouped_into 'root' }
  end

  %w(
    /usr/local/lib/systemd/system/cmogstored.socket
    /usr/local/lib/systemd/system/cmogstored@.service
  ).each do |f|
    describe file(f) do
      it { should be_file }
      it { should be_owned_by 'root' }
      it { should be_grouped_into 'root' }
    end
  end

  %w(
    cmogstored.socket
    cmogstored@1.service
  ).each do |s|
    describe service(s) do
      it { should be_enabled }
      it { should be_running }
    end
  end
end
