window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
  const addTaxDom = document.getElementById('add-tax-price');
  const salesProfit = document.getElementById('profit');
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    addTaxDom.innerHTML = Math.floor(inputValue / 10);
    salesProfit.innerHTML = Math.floor(inputValue - inputValue / 10);
  });
});