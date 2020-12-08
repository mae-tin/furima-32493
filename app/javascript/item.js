function item (){
  const price = document.getElementById("item-price");
  price.addEventListener("keyup", () => {
    const addTaxPrice = price.value * 0.1;
    const ShowTaxPrice = document.getElementById("add-tax-price");
    ShowTaxPrice.innerHTML = parseInt(addTaxPrice);

    const profit = price.value - addTaxPrice;
    const ShowProfit = document.getElementById("profit");
    ShowProfit.innerHTML = parseInt(profit);

  })
}

window.addEventListener('load', item)