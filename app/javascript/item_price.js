// item_price.js

// ページが読み込まれた時に実行される
window.addEventListener('turbo:load', () => {
  // 金額入力欄を取得
  const priceInput = document.getElementById("item-price");
  
  // 販売手数料表示欄を取得
  const taxPrice = document.getElementById("add-tax-price");
  
  // 販売利益表示欄を取得
  const profit = document.getElementById("profit");

  // 要素が正しく取得できたか確認
  console.log(priceInput);
  console.log(taxPrice);
  console.log(profit);

  // 入力欄が存在する場合のみイベントリスナーを追加
  if (priceInput) {
    priceInput.addEventListener("input", () => {
      const inputValue = priceInput.value; // 入力された金額を取得
      console.log(inputValue); // 取得した金額をコンソールに表示
    });
  }
});
