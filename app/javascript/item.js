if (document.URL.match( /new/ ) || document.URL.match ( /edit/ )) {
function item (){
  const price = document.getElementById("item-price");
  price.addEventListener('keyup', () => {
    const productPrice = price.value;
    const addTaxPrice = document.getElementById("add-tax-price");
    const profit = document.getElementById("profit")
    addTaxPrice.innerHTML = productPrice * 0.1;
    profit.innerHTML = productPrice - (productPrice * 0.1);
  });
}

window.addEventListener("load", item);
}