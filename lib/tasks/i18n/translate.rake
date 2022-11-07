# frozen_string_literal: true

namespace :i18n do
  desc 'Translate an i18n file.'
  task :translate, [:path, :target_lang] => :environment do |task, args|
    dirname = File.dirname(args.path)
    filename = File.basename(args.path)
    matches = filename.match(/^(.*?).en.yml$/)
    prefix = matches ? "#{matches[1]}." : ""
    engine = YAML.load(File.read(Rails.root.join("config", "i18n-translate.yml")))["engine"]

    translator = ::YamlTranslator.create(
      engine,
      api_key: ::Rails.application.credentials.i18n_translate_api_key
    )

    english_locale = translator.file(args.path)
    japanese_locale = english_locale.to(args.target_lang.to_sym)

    japanese_locale.save_to(dirname, {prefix: prefix})
    puts "Translated #{args.path} to #{args.target_lang}"
  end

  desc 'Install i18n-translate'
  task :install do
    target_filepath = "#{Rails.root}/config/i18n-translate.yml"
    if File.exist?(target_filepath)
      puts "Already exist file. #{target_filepath}"
    else
      FileUtils.cp("#{I18n::Translate.root}/config/i18n-translate.yml", target_filepath)
      puts "Installed the config. #{target_filepath}"
    end
  end
end
