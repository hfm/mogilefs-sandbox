require 'rake'
require 'rspec/core/rake_task'
require 'yaml'

def nodes
  Rake::FileList['nodes/*.yml']
end

def roles(node)
  YAML.load_file(node)['roles']
end

desc "Run serverspec tests to all"
task :spec    => 'spec:all'
task :default => :spec
namespace :spec do
  task :all     => nodes.pathmap('%n')
  task :default => :all

  nodes.each do |node|
    host = node.pathmap('%n')
    desc "Run serverspec tests to #{host}"
    RSpec::Core::RakeTask.new(host.to_sym) do |t|
      ENV['TARGET_HOST'] = host
      t.fail_on_error = false
      t.pattern = "spec/roles/{#{roles(node).join(?,)}}_spec.rb"
    end
  end
end

desc "Run itamae to all"
task :apply => 'apply:all'
namespace :apply do
  task :all     => nodes.pathmap('%n')
  task :dafault => :all

  nodes.each do |node|
    host = node.pathmap('%n')
    desc "Run itamae to #{host}"
    task host do
      cmd = %W(bundle exec itamae ssh --vagrant -h #{host} -y #{node} bootstrap.rb).shelljoin
      puts cmd
      Bundler.clean_system cmd
    end
  end
end

desc "Itamae and Serverspec"
task :all_in_one do
  Bundler.clean_system("vagrant up")
  Rake::Task['apply'].invoke
  Rake::Task['spec'].invoke
end
