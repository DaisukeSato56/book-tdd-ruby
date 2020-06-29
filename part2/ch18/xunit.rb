# frozen_string_literal: true

require 'rspec/expectations'

class TestCase
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def run
    method = send(@name) # 変更してください
    method
  end
end

class WasRun < TestCase
  attr_accessor :was_run

  def initialize(name)
    @was_run = nil
    super(name)
  end

  def test_method
    @was_run = 1
  end
end

class TestCaseTest < TestCase
  include RSpec::Matchers

  def test_running
    test = WasRun.new('test_method')
    expect(test.was_run).to eq nil
    test.run
    expect(test.was_run).to eq 1
  end
end

TestCaseTest.new('test_running').run
