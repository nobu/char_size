# frozen_string_literal: true

require_relative "test_helper"

require "char_size"

class CharSizeTest < Minitest::Test
  def test_min_with_utf_8_encoding
    assert_equal 1, CharSize.min(Encoding::UTF_8)
  end

  def test_min_with_utf_8_name
    assert_equal 1, CharSize.min("UTF-8")
  end

  def test_min_with_unknown_encoding
    assert_raises ArgumentError do
      CharSize.min("WTF-8")
    end
  end

  def test_max_with_utf_8_encoding
    assert_equal 6, CharSize.max(Encoding::UTF_8)
  end

  def test_max_with_utf_8_name
    assert_equal 6, CharSize.max("UTF-8")
  end

  def test_max_with_unknown_encoding
    assert_raises ArgumentError do
      CharSize.max("WTF-8")
    end
  end

  def test_minmax_with_utf_8_encoding
    assert_equal [1, 6], CharSize.minmax(Encoding::UTF_8)
  end

  def test_minmax_with_utf_8_name
    assert_equal [1, 6], CharSize.minmax("UTF-8")
  end

  def test_minmax_with_unknown_encoding
    assert_raises ArgumentError do
      CharSize.max("WTF-8")
    end
  end
end
