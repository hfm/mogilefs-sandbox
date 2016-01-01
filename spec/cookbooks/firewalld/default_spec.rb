require 'spec_helper'

describe 'firewalld' do
  describe package('firewalld') do
    it { should be_installed }
  end

  describe service('firewalld') do
    it { should be_enabled }
    it { should be_running }
  end
end
