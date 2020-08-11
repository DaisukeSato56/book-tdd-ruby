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
    set_up
    method = send(@name)
    method
    tear_down
  end
end

# テストメソッドが起動されたかどうかを記録する
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
end

TestCaseTest.new('test_template_method').run
