include_recipe "../perl-build/definitions.rb"

perl_version = "5.20.3"

perl perl_version

link "/opt/perl-latest" do
  to "/opt/perl-#{perl_version}"
end
