define :perl, path: nil do
  version = params[:name]
  path = params[:path] || "/opt/perl-#{version}"

  url = 'https://raw.githubusercontent.com/tokuhirom/Perl-Build/master/perl-build'
  execute 'perl-build' do
    command "curl #{url} | perl - #{version} #{path}"
    not_if "test -x #{path}/bin/perl"
  end
end
