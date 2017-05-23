#include <char_size.h>

/*
 * Gets the minimum character size (in bytes) for an encoding.
 * @param encoding_or_name [Encoding, String] the encoding or its name
 * @return [Integer] the minimum character size
 * @example
 *   CharSize.min("UTF-8")         # => 1
 *   CharSize.min(Encoding::UTF_8) # => 1
 */
static VALUE min(VALUE class, VALUE encoding_or_name) {
  rb_encoding *enc = rb_to_encoding(encoding_or_name);
  return INT2NUM(ONIGENC_MBC_MINLEN(enc));
}

/*
 * Gets the maximum character size (in bytes) for an encoding.
 * @param encoding_or_name [Encoding, String] the encoding or its name
 * @return [Integer] the maximum character size
 * @example
 *   CharSize.max("UTF-8")         # => 6
 *   CharSize.max(Encoding::UTF_8) # => 6
 */
static VALUE max(VALUE class, VALUE encoding_or_name) {
  rb_encoding *enc = rb_to_encoding(encoding_or_name);
  return INT2NUM(ONIGENC_MBC_MAXLEN(enc));
}

/*
 * Gets the minimum and maximum character size (in bytes) for an encoding.
 * @param encoding_or_name [Encoding, String] the encoding or its name
 * @return [Array<(Integer, Integer)>] the minimum and maximum character size
 * @example
 *   CharSize.minmax("UTF-8")         # => [1, 6]
 *   CharSize.minmax(Encoding::UTF_8) # => [1, 6]
 */
static VALUE minmax(VALUE class, VALUE encoding_or_name) {
  rb_encoding *enc = rb_to_encoding(encoding_or_name);
  VALUE min = INT2NUM(ONIGENC_MBC_MINLEN(enc));
  VALUE max = INT2NUM(ONIGENC_MBC_MAXLEN(enc));
  return rb_assoc_new(min, max);
}

/*
 * The +CharSize+ module provides functions that return the character size limits
 * of encodings.
 */
void Init_char_size() {
  VALUE CharSize = rb_define_module("CharSize");
  rb_define_singleton_method(CharSize, "min", min, 1);
  rb_define_singleton_method(CharSize, "max", max, 1);
  rb_define_singleton_method(CharSize, "minmax", minmax, 1);
}
