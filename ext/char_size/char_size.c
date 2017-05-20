#include <char_size.h>

static rb_encoding* find_encoding(VALUE encoding_or_name) {
  rb_encoding* encoding = rb_find_encoding(encoding_or_name);
  if (encoding == NULL) rb_raise(rb_eArgError, "unknown encoding name - %"PRIsVALUE, encoding_or_name);
  return encoding;
}

static VALUE min(VALUE class, VALUE encoding_or_name) {
  return INT2NUM(find_encoding(encoding_or_name)->min_enc_len);
}

static VALUE max(VALUE class, VALUE encoding_or_name) {
  return INT2NUM(find_encoding(encoding_or_name)->max_enc_len);
}

void Init_char_size() {
  VALUE CharSize = rb_define_module("CharSize");
  rb_define_singleton_method(CharSize, "min", min, 1);
  rb_define_singleton_method(CharSize, "max", max, 1);
}
