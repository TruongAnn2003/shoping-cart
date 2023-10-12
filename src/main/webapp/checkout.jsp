<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="initial-scale=1, width=device-width" />
  <link href="./public/logo.svg" rel="icon" type="image/png"/>
  <link rel="stylesheet" href="./styles/global.css" />
  <link rel="stylesheet" href="./styles/checkout.css" />
  <link
          rel="stylesheet"
          href="https://fonts.googleapis.com/css2?family=Mali:wght@400;700&display=swap"
  />
</head>
<body>
<div class="mouse">
</div>
<div class="checkout">
  <div class="checkout-child"></div>
  <img class="group-icon" alt="" src="./public/group@2x.png" />

  <b class="checkout-isnt-finished">Checkout isn't finished yet!</b>
  <form action="" method="post" >
    <input type="hidden" name="action" value="continue">
    <input type="submit" class="shopping-btn-icon button" style="background: url(./public/shoppingbtn.svg);border-width: 0px; color: transparent; background-repeat: no-repeat; width: 9.5%;">
  </form>

  <div class="checkout-item"></div>
  <img class="logo-icon" alt="" src="./public/logo.svg" />
  <a href="http://www.tii.lol">
    <img class="home-btn-icon button" alt="" src="./public/homebtn.svg" />
  </a>

  <img id="shopingBtn" class="shoping-btn-icon button" alt="" src="./public/shopingbtn.svg" />
</div>
<script type="text/javascript">
  const cursor = document.querySelector(".mouse")
  var timeout;
  document.addEventListener("mousemove", (e) => {
    let x = e.clientX;
    let y = e.clientY;
    cursor.style.top = y + "px";
    cursor.style.left = x + "px";
    cursor.style.display = "block";
    function mouseStopped() {
      cursor.style.display = "none";
    }
    clearTimeout(timeout);
    timeout = setTimeout(mouseStopped, 1000);
  });
  document.addEventListener("mouseout", () => {
    cursor.style.display = "none";
  })
  document.addEventListener("mousedown", () => {
    cursor.style.display = "none";
  })
</script>
</body>
</html>
