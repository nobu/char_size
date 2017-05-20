# frozen_string_literal: true

require "char_size/char_size"
require "char_size/version"

module CharSize
  def self.minmax(encoding_or_name)
    [min(encoding_or_name), max(encoding_or_name)]
  end
end
