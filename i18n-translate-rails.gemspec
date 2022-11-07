# frozen_string_literal: true

require_relative "lib/i18n/translate/rails/version"

Gem::Specification.new do |spec|
  spec.name = "i18n-translate-rails"
  spec.version = I18n::Translate::Rails::VERSION
  spec.authors = ["Yusuke"]
  spec.email = ["yusuke@slidict.io"]

  spec.summary = "Automatic translation locale"
  spec.description = "Automatic translation into the target language based on the base i18n yaml."
  spec.homepage = "https://blog.slidict.io/gems/i18n-translate-rails"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.6.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/slidict/i18n-translate-rails/"
  spec.metadata["changelog_uri"] = "https://github.com/slidict/i18n-translate-rails/releases"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:bin|test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "yaml-translator"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
