# frozen_string_literal: true

require "fileutils"
require "yaml-translator"
require_relative "i18n/translate/rails"

module I18n::Translate
  def self.root
    File.expand_path '../..', __FILE__
  end
end
