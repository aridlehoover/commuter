if defined?(RSpec)
  namespace :spec do
    task :all do
      Rake::Task['spec:unit'].invoke
      Rake::Task['spec:acceptance'].invoke
    end

    task :unit do
      Rake::Task['spec'].invoke
      # Rake::Task['jasmine:ci'].invoke
    end

    task :acceptance do
      Rake::Task['cucumber'].invoke
    end
  end
end

Rake::Task["default"].clear

task :default => ['spec:all']
