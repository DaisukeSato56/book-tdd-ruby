# frozen_string_literal: true

require 'rspec/expectations'

class TestCase
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def set_up; end

  def tear_down; end

  def run
    set_up
    method = send(@name)
    method
    tear_down
    TestResult.new
  end
end

class WasRun < TestCase
  attr_accessor :was_run, :was_set_up, :log

  def test_method
    @log = log + 'test_method '
  end

  def set_up
    @log = 'set_up '
  end

  def tear_down
    @log = log + 'tear_down '
  end
end

class TestCaseTest < TestCase
  include RSpec::Matchers

  attr_accessor :test

  def test_template_method
    test = WasRun.new('test_method')
    test.run
    expect(test.log).to eq 'set_up test_method tear_down '
  end

  def test_result
    test = WasRun.new('test_method')
    result = test.run
    expect(result.summary).to eq '1 run, 0 failed'
  end
end

class TestResult
  def summary
    '1 run, 0 failed'
  end
end

TestCaseTest.new('test_template_method').run
TestCaseTest.new('test_result').run
