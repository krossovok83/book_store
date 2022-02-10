
const shipping_collect = Array.prototype.slice.call(document.getElementById("shipping").elements);

document.getElementById("checkbox_shipping").addEventListener("change", function ChekBoxShipping() {
    shipping_collect.forEach((elem) => elem.readOnly = true);
});
