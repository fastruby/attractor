# frozen_string_literal: true

require 'descriptive_statistics/safe'
require 'fileutils'
require 'launchy'
require 'tilt'

module Attractor
  # base reporter
  class BaseReporter
    extend Forwardable
    attr_accessor :values, :file_prefix
    def_delegator :@watcher, :watch

    def initialize(file_prefix: '', calculators:)
      @file_prefix = file_prefix
      @calculator = calculators.first
      @values = @calculator.calculate
      @suggester = Suggester.new(values)

      @watcher = Watcher.new(file_prefix, lambda do
        report
      end)
    end

    def suggestions(quantile)
      @suggestions = @suggester.suggest(quantile)
      @suggestions
    end

    def report
      @suggestions = @suggester.suggest
    end

    def render
      'Attractor'
    end
  end
end
