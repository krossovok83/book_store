
// const form = document.getElementById("shipping");
// const shipping_collect = form ? Array.prototype.slice.call(form.elements) : [];
// const checkbox = document.getElementById("checkbox_shipping")
//
// checkbox && checkbox.addEventListener("change", function ChekBoxShipping() {
//     shipping_collect.forEach((elem) => elem.readOnly = true);
// });

$(document).on('change', '#checkbox_shipping', function(event) {
  $('#shipping input').attr('disabled', $(event.target).is(":checked"));
});