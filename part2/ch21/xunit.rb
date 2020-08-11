# frozen_string_literal: true

require 'rspec/expectations'

# テストメソッドを動的に呼び出す責務を持つ
class TestCase
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def set_up; end

  def tear_down; end

  def run
    result = TestResult.new
    result.test_started
    set_up
    method = send(@name)
    method
    tear_down
    result
  end
end

# テストメソッドが起動されたかどうかを記録する
class WasRun < TestCase
  attr_accessor :log

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

# テストの実行に関しての責務を持つ
class TestCaseTest < TestCase
  include RSpec::Matchers

  attr_accessor :test

  def test_template_method
    #
    # テストには三つのパターン
    #
    test = WasRun.new('test_method')                        # オブジェクトの生成
    test.run                                                # 実行
    expect(test.log).to eq 'set_up test_method tear_down '  # アサート
  end

  def test_result
    test = WasRun.new('test_method')
    result = test.run
    expect(result.summary).to eq '1 run, 0 failed'
  end
end

class TestResult
  attr_accessor :run_count

  def initialize
    @run_count = 0
  end

  def test_started
    self.run_count += 1
  end

  def summary
    "#{run_count} run, 0 failed"
  end
end

TestCaseTest.new('test_template_method').run
TestCaseTest.new('test_result').run
