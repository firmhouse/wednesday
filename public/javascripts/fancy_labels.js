/* DO NOT MODIFY. This file was compiled Fri, 22 Apr 2011 16:43:12 GMT from
 * /Users/michiel/Code/wednesday/app/coffeescripts/fancy_labels.coffee
 */

(function() {
  $(document).ready(function() {
    var input, _i, _len, _ref, _results;
    $(".fancy_label input, .fancy_label textarea").focus(function() {
      return $(this).parents('.fancy_label').find('label').hide();
    });
    $(".fancy_label input, .fancy_label textarea").blur(function() {
      if ($(this).val().length === 0) {
        return $(this).parents('.fancy_label').find('label').show();
      }
    });
    $(".fancy_label label, .fancy_label textarea").click(function() {
      return $(this).parents('.fancy_label').find('input').focus();
    });
    _ref = $(".fancy_label input, .fancy_label textarea");
    _results = [];
    for (_i = 0, _len = _ref.length; _i < _len; _i++) {
      input = _ref[_i];
      _results.push($(input).val().length > 0 ? $(input).parent('.fancy_label').find('label').hide() : void 0);
    }
    return _results;
  });
}).call(this);
