#include <char_size.h>

static rb_encoding* find_encoding(VALUE encoding_or_name) {
  rb_encoding* encoding = rb_find_encoding(encoding_or_name);
  if (encoding == NULL) rb_raise(rb_eArgError, "unknown encoding name - %"PRIsVALUE, encoding_or_name);
  return encoding;
}

/*
 * Gets the minimum character size (in bytes) for an encoding.
 * @param encoding_or_name [Encoding, String] the encoding or its name
 * @return [Integer] the minimum character size
 * @example
 *   CharSize.min("UTF-8")         # => 1
 *   CharSize.min(Encoding::UTF_8) # => 1
 */
static VALUE min(VALUE class, VALUE encoding_or_name) {
  return INT2NUM(find_encoding(encoding_or_name)->min_enc_len);
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
  return INT2NUM(find_encoding(encoding_or_name)->max_enc_len);
}

void Init_char_size() {
  VALUE CharSize = rb_define_module("CharSize");
  rb_define_singleton_method(CharSize, "min", min, 1);
  rb_define_singleton_method(CharSize, "max", max, 1);
}
