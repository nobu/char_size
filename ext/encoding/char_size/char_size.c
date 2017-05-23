#include <ruby.h>
#include <ruby/encoding.h>

/*
 * Gets the minimum character size (in bytes) for an encoding.
 * @param encoding_or_name [Encoding, String] the encoding or its name
 * @return [Integer] the minimum character size
 * @example
 *   "UTF-8".min_char_size         # => 1
 *   Encoding::UTF_8.min_char_size # => 1
 */
static VALUE
min(VALUE class, VALUE encoding_or_name)
{
    rb_encoding *enc = rb_to_encoding(encoding_or_name);
    return INT2NUM(ONIGENC_MBC_MINLEN(enc));
}

/*
 * Gets the maximum character size (in bytes) for an encoding.
 * @param encoding_or_name [Encoding, String] the encoding or its name
 * @return [Integer] the maximum character size
 * @example
 *   "UTF-8".max_char_size         # => 6
 *   Encoding::UTF_8.max_char_size # => 6
 */
static VALUE
max(VALUE class, VALUE encoding_or_name)
{
    rb_encoding *enc = rb_to_encoding(encoding_or_name);
    return INT2NUM(ONIGENC_MBC_MAXLEN(enc));
}

/*
 * Gets the minimum and maximum character size (in bytes) for an encoding.
 * @param encoding_or_name [Encoding, String] the encoding or its name
 * @return [Array<(Integer, Integer)>] the minimum and maximum character size
 * @example
 *   "UTF-8".minmax_char_size         # => [1, 6]
 *   Encoding::UTF_8.minmax_char_size # => [1, 6]
 */
static VALUE
minmax(VALUE encoding_or_name)
{
    rb_encoding *enc = rb_to_encoding(encoding_or_name);
    return rb_assoc_new(INT2NUM(ONIGENC_MBC_MINLEN(enc)),
			INT2NUM(ONIGENC_MBC_MAXLEN(enc)));
}

static void
define_char_size_methods(VALUE klass)
{
    rb_define_method(klass, "min_char_size", min, 0);
    rb_define_method(klass, "max_char_size", max, 0);
    rb_define_method(klass, "minmax_char_size", minmax, 0);
}

void
Init_char_size(void)
{
    rb_require("encoding/char_size/version.rb");
    define_char_size_methods(rb_cEncoding);
    define_char_size_methods(rb_cString);
}
