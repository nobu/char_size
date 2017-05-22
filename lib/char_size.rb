# frozen_string_literal: true

require "char_size/char_size"
require "char_size/version"

# The +CharSize+ module provides functions that return the character size limits
# of encodings.
module CharSize
  # Gets the minimum and maximum character size (in bytes) for an encoding.
  # @param encoding_or_name [Encoding, String] the encoding or its name
  # @return [Array<(Integer, Integer)>] the minimum and maximum character size
  # @example
  #   CharSize.minmax("UTF-8")         # => [1, 6]
  #   CharSize.minmax(Encoding::UTF_8) # => [1, 6]
  def self.minmax(encoding_or_name)
    [min(encoding_or_name), max(encoding_or_name)]
  end
end
