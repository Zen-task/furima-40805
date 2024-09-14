function calculatePrice() {
  const priceInput = document.getElementById("item-price");
  const taxPrice = document.getElementById("add-tax-price");
  const profit = document.getElementById("profit");

  if (priceInput) {
    priceInput.addEventListener("input", () => {
      const inputValue = priceInput.value;

      if (inputValue) {
        const fee = Math.floor(inputValue * 0.1);
        const profitAmount = Math.floor(inputValue - fee);
        taxPrice.innerHTML = fee.toLocaleString();
        profit.innerHTML = profitAmount.toLocaleString();
      } else { 
        taxPrice.innerHTML = ''; 
        profit.innerHTML = '';
      } 
    });
  } 
}

window.addEventListener('turbo:load', calculatePrice);
window.addEventListener('turbo:render', calculatePrice);