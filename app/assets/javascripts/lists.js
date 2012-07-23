function remove_field(link)
{
  $(link).parent("div.ui-accordion-content").find("input[id$='_destroy']").val(1);
  $(link).parent("div.ui-accordion-content").prev('h3').remove();
  $(link).parent("div.ui-accordion-content").remove();
  $('.accordion').accordion("destroy");
  $('.accordion').accordion({
    autoHeight: false,
    active: $('.accordion h3').last(),
    collapsible:true
  });
}

function add_field(link, association, content) {
  var new_id = new Date().getTime();
  var regexp = new RegExp("new_" + association, "g")
  var target = $(link).parent().find('.accordion > div').last();
  if (target.length > 0)
    target.after(content.replace(regexp, new_id));
  else
    $(link).parent().find('.accordion').prepend(content.replace(regexp, new_id));

  $('.accordion').after($('.accordion > input').remove());

  $('.accordion').accordion("destroy");
  $('.accordion').accordion({
    autoHeight: false,
    active: $('.accordion h3').last(),
    collapsible:true
  });
  $('.name-field')
  .change(function() {
    $(this).closest('div.ui-accordion-content').prev('h3').find('a').text($(this).val());
  })
  .focus();
}
