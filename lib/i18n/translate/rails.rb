# frozen_string_literal: true

require_relative "rails/version"

module I18n
  module Translate
    module Rails
      class Error < StandardError; end
      class Railtie < ::Rails::Railtie
        config.i18n_translate_engine = nil
        rake_tasks do
          load "tasks/i18n/translate.rake"
        end
      end
    end
  end
end
