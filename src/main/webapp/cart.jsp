<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="initial-scale=1, width=device-width" />
  <link href="./public/logo.svg" rel="icon" type="image/png"/>
  <link rel="stylesheet" href="./styles/global.css" />
  <link rel="stylesheet" href="./styles/shopingcart.css" />
  <link
          rel="stylesheet"
          href="https://fonts.googleapis.com/css2?family=Mali:wght@400;700&display=swap"
  />
</head>
<body>
<div class="shopingcart">
  <div class="shopingcart-child"></div>
  <b class="your-cart">Your Cart</b>
  <div class="cart-item-wrapper">
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <c:forEach var="item" items="${cart.items}">
      <div class="cart-item ">
        <img class="cart-item-child " alt="" src="./public/group-11.svg" />

        <img class="package-icon" alt="" src="./public/package.svg" />

        <div class="productname">
          <div class="productname-child"></div>
          <b class="title">Product Name</b>
          <c:if test="${item.product.code == '2301'}">
          <div class="name">Matcha Milk Tea</div>
          </c:if>
          <c:if test="${item.product.code == '2302'}">
            <div class="name">Strawberry Milk Tea</div>
          </c:if>
          <c:if test="${item.product.code == '2304'}">
            <div class="name">Blueberry Milk Tea</div>
          </c:if>
          <c:if test="${item.product.code == '2303'}">
            <div class="name">Chocolate Milk Tea</div>
          </c:if>

        </div>
        <form class="productname1" action="" method="post">
          <input type="hidden" name="productCode"
                 value="<c:out value='${item.product.code}'/>">
          <div class="productname-item"></div>
          <b class="title1">Quantity</b>
          <input  type="submit" class="update-btn button  " value="Update" style="background: url(./public/update-btn.svg);border-width: 0px; color: transparent; background-repeat: no-repeat; width: 25%;">

          <input class="productname-inner" type=text name="quantity"
                 value="<c:out value='${item.quantity}'/>" id="quantity">
          <img class="add-btn-icon button" alt="" src="./public/add-btn.svg" />

          <img class="add-btn-icon1 button" alt="" src="./public/add-btn1.svg" />
        </form>
        <div class="productname2">
          <div class="rectangle-div"></div>
          <b class="title2">Descriptions</b>
          <div class="name1"><c:out value='${item.product.description}'/></div>
        </div>
        <div class="cart-item-item"></div>
        <div class="productname3">
          <div class="productname-child1"></div>
          <b class="title3">Price</b>
          <div class="price">${item.product.priceCurrencyFormat}</div>
        </div>
        <div class="productname4">
          <div class="productname-child2"></div>
          <b class="title4">Amount</b>
          <div class="price1">${item.totalCurrencyFormat}</div>
        </div>
        <form action="" method="post">
          <input type="hidden" name="productCode"
                 value="<c:out value='${item.product.code}'/>">
          <input type="hidden" name="quantity"
                 value="0">
          <input type="submit" value="Remove Item" class="delete-btn button" style="background: url(./public/delete-btn.svg);border-width: 0px; color: transparent; background-repeat: no-repeat; width: 20%;">
        </form>

      </div>
    </c:forEach>
  </div>
  <form action="" method="post" >
    <input type="hidden" name="action" value="shop">
    <input type="submit" class="shopping-btn-icon1 button" style="background: url(./public/shoppingbtn.svg);border-width: 0px; color: transparent; background-repeat: no-repeat; width: 9.5%;">
  </form>

  <form action="" method="post"  >
    <input type="hidden" name="action" value="checkout">
    <input type="submit" class="checkout-btn-icon button" style="background: url(./public/checkoutbtn.svg); border-width: 0px; color: transparent;background-repeat: no-repeat; width: 20%;">
  </form>


  <img class="cart-img-icon" alt="" src="./public/cartimg.svg" />

  <div class="shopingcart-item"></div>
  <img class="logo-icon1" alt="" src="./public/logo.svg" />
  <a href="http://www.tii.lol">
    <img class="home-btn-icon1 button" alt="" src="./public/homebtn.svg" /></a>

  <img id="shopingBtn" class="shoping-btn-icon1 button" style="margin-top: -8px;" alt="" src="./public/shopingbtn1.svg" />
</div>
</body>
</html>
