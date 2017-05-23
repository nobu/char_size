# frozen_string_literal: true

require_relative "test_helper"

require "encoding/char_size"

class CharSizeTest < Minitest::Test
  def test_min_with_utf_8_encoding
    assert_equal 1, Encoding::UTF_8.min_char_size
  end

  def test_min_with_utf_8_name
    assert_equal 1, "UTF-8".min_char_size
  end

  def test_min_with_unknown_encoding
    assert_raises ArgumentError do
      "WTF-8".min_char_size
    end
  end

  def test_max_with_utf_8_encoding
    assert_equal 6, Encoding::UTF_8.max_char_size
  end

  def test_max_with_utf_8_name
    assert_equal 6, "UTF-8".max_char_size
  end

  def test_max_with_unknown_encoding
    assert_raises ArgumentError do
      "WTF-8".max_char_size
    end
  end

  def test_minmax_with_utf_8_encoding
    assert_equal [1, 6], Encoding::UTF_8.minmax_char_size
  end

  def test_minmax_with_utf_8_name
    assert_equal [1, 6], "UTF-8".minmax_char_size
  end

  def test_minmax_with_unknown_encoding
    assert_raises ArgumentError do
      "WTF-8".max_char_size
    end
  end
end
