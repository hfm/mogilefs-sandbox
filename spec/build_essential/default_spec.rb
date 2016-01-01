require 'spec_helper'

describe 'build essential' do
  %w(
    gcc
    git
    libxml2-devel
    openssl-devel
    expat-devel
    sqlite-devel
    patch
  ).each do |pkg|
    describe package(pkg) do
      it { should be_installed }
    end
  end
end
