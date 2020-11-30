window.addEventListener("load",() => {
  const priceId = document.getElementById("item-price");

  priceId.addEventListener("input", () => {
    const price = document.getElementById("item-price").value;
    const profit = Math.floor(price * 0.9);
    document.getElementById("profit").innerHTML = profit

    const tax = Math.ceil(price * 0.1);
    document.getElementById("add-tax-price").innerHTML = tax

    
  })
});
