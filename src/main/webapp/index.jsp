<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="initial-scale=1, width=device-width" />
    <link href="./public/logo.svg" rel="icon" type="image/png"/>
    <link rel="stylesheet" href="./styles/global.css" />
    <link rel="stylesheet" href="./styles/index.css" />
    <link
            rel="stylesheet"
            href="https://fonts.googleapis.com/css2?family=Mali:wght@400;700&display=swap"
    />
</head>
<body>
<div class="index1">
    <img class="menu-img-icon" alt="" src="./public/menuimg@2x.png" />

    <div class="milk-tea-1-wrapper">
        <img class="milk-tea-1" alt="" src="./public/milk-tea-1@2x.gif" />
    </div>
    <img class="milktea-icon" alt="" src="./public/milktea@2x.png" />
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <c:forEach var="product" items="${products}">

            <c:if test="${product.code == '2301'}">
                <div class="product button">
                    <div class="product-child"></div>
                    <div class="product-item"></div>
                    <b class="matcha-milk-tea">Matcha Milk Tea</b>
                    <div class="product-inner"></div>
                    <b class="the-sweetness-of"
                    ><c:out value='${product.description}'/></b
                    >
                    <img class="milk-img-icon" alt="" src="./public/milkimg@2x.png" />

                    <img class="matcha-icon" alt="" src="./public/matcha@2x.png" />
                    <div class="btn-add button" >
                        <form action="cart" method="post" style="background-color: red">
                            <input type="hidden" name="productCode" value="<c:out value='${product.code}'/>">
                            <input type="hidden" name="action" value="cart">
                            <input style="color: white;cursor: pointer;" class="btn-add-child" type="submit" value="Add To Cart">
                        </form>
                    </div>
                    <div class="price2">
                        <div class="price-child"></div>
                        <b class="price-12">Price: ${product.priceCurrencyFormat}</b>
                    </div>
                    <img
                            class="flower-matcha-icon"
                            alt=""
                            src="./public/flowermatcha@2x.png"
                    />
                </div>
            </c:if>
            <c:if test="${product.code == '2302'}">
                <div class="product1 button">
                    <div class="product-child"></div>
                    <div class="product-item"></div>
                    <b class="matcha-milk-tea">Strawberry Milk Tea</b>
                    <div class="product-inner"></div>
                    <b class="the-sweetness-of"
                    ><c:out value='${product.description}'/></b
                    >
                    <img class="milk-img-icon" alt="" src="./public/milkimg@2x.png" />

                    <div class="btn-add button" >
                        <form action="cart" method="post" style="background-color: red">
                            <input type="hidden" name="productCode" value="<c:out value='${product.code}'/>">
                            <input type="hidden" name="action" value="cart">
                            <input style="color: white;cursor: pointer;" class="btn-add-child" type="submit" value="Add To Cart">
                        </form>
                    </div>
                    <div class="price2">
                        <div class="price-child"></div>
                        <b class="price-12">Price: ${product.priceCurrencyFormat}</b>
                    </div>
                    <img class="scream-icon" alt="" src="./public/scream@2x.png" />

                    <img class="strawberry-icon" alt="" src="./public/strawberry@2x.png" />
                </div>
            </c:if>
            <c:if test="${product.code == '2304'}">
                <div class="product2 button">
                    <div class="product-child"></div>
                    <div class="product-item"></div>
                    <b class="matcha-milk-tea">Blueberry Milk Tea</b>
                    <div class="product-inner"></div>
                    <b class="the-sweetness-of"
                    ><c:out value='${product.description}'/></b
                    >
                    <img class="milk-img-icon" alt="" src="./public/milkimg@2x.png" />

                    <div class="btn-add button" >
                        <form action="cart" method="post" style="background-color: red">
                            <input type="hidden" name="productCode" value="<c:out value='${product.code}'/>">
                            <input type="hidden" name="action" value="cart">
                            <input style="color: white;cursor: pointer;" class="btn-add-child" type="submit" value="Add To Cart">
                        </form>
                    </div>
                    <div class="price2">
                        <div class="price-child"></div>
                        <b class="price-12">Price: ${product.priceCurrencyFormat}</b>
                    </div>
                    <img class="blueberry-icon" alt="" src="./public/blueberry@2x.png" />

                    <img
                            class="blueberry-milktea-icon"
                            alt=""
                            src="./public/blueberrymilktea@2x.png"
                    />
                </div>
            </c:if>
            <c:if test="${product.code == '2303'}">
                <div class="product3 button">
                    <div class="product-child"></div>
                    <div class="product-item"></div>
                    <b class="matcha-milk-tea">Chocolate Milk Tea</b>
                    <div class="product-inner"></div>
                    <b class="the-sweetness-of"
                    ><c:out value='${product.description}'/></b
                    >
                    <img class="milk-img-icon" alt="" src="./public/milkimg@2x.png" />

                    <div class="btn-add button" >
                        <form action="cart" method="post" style="background-color: red">
                            <input type="hidden" name="productCode" value="<c:out value='${product.code}'/>">
                            <input type="hidden" name="action" value="cart">
                            <input style="color: white;cursor: pointer;" class="btn-add-child" type="submit" value="Add To Cart">
                        </form>
                    </div>
                    <div class="price2">
                        <div class="price-child"></div>
                        <b class="price-12">Price: ${product.priceCurrencyFormat}</b>
                    </div>
                    <img class="tranchau-icon" alt="" src="./public/tranchau@2x.png" />

                    <img class="black-sugar-icon" alt="" src="./public/blacksugar@2x.png" />
                </div>
            </c:if>




    </c:forEach>

    <div class="index-child"></div>
    <img class="logo-icon2" alt="" src="./public/logo1.svg" />
    <form action="" method="post">
        <input type="hidden" name="action" value="showcart">
        <input type="submit" class="shoping-btn-icon2 button" style="background: url(./public/shopingbtn2.svg);border-width: 0px; color: transparent; background-repeat: no-repeat; width: 9.5%;">
    </form>
    <a href="http://www.tii.lol">
        <img class="home-btn-icon2 button" alt="" src="./public/homebtn1.svg" /></a>
</div>


</body>
</html>
