# frozen_string_literal: true

require 'rspec/expectations'

class TestCase
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def set_up; end

  def run
    set_up
    method = send(@name)
    method
  end
end

class WasRun < TestCase
  attr_accessor :was_run, :was_set_up, :log

  def test_method
    @was_run = 1
  end

  def set_up
    @was_run = nil
    @was_set_up = 1
    @log = 'set_up '
  end
end

class TestCaseTest < TestCase
  include RSpec::Matchers

  attr_accessor :test

  def set_up
    self.test = WasRun.new('test_method')
  end

  def test_running
    self.test.run
    expect(test.was_run).to eq 1
  end

  def test_set_up
    test.run
    expect(test.log).to be 'set_up '
  end
end

TestCaseTest.new('test_running').run
TestCaseTest.new('test_set_up').run
