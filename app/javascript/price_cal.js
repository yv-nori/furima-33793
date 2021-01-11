const isNumber = function(value) {
  return ((typeof value === 'number') && (isFinite(value)));
};
const price_cal = () => {

  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("keyup", function() {
    const tax = 0.1;
    const minPrice = 300;
    const maxPrice = 9999999;
    const price = parseInt(this.value);

    if (price <= maxPrice && price >= minPrice) {
      const taxPrice = document.getElementById("add-tax-price");
      const profit = document.getElementById("profit");
      taxPrice.textContent = price * tax;
      profit.textContent = price - (price * tax);

    };
  });
};

window.addEventListener("load", price_cal);
