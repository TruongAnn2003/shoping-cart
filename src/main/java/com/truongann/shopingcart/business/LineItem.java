package com.truongann.shopingcart.business;

import java.io.Serializable;
import java.text.NumberFormat;
import java.util.Currency;
import java.util.Locale;

public class LineItem implements Serializable {
    public LineItem(Product product, int quantity) {
        this.product = product;
        this.quantity = quantity;
    }

    private Product product;
    private int quantity;

    public LineItem() {}

    public void setProduct(Product p) {
        product = p;
    }

    public Product getProduct() {
        return product;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getQuantity() {
        return quantity;
    }

    public double getTotal() {
        double total = product.getPrice() * quantity;
        return total;
    }

    public String getTotalCurrencyFormat() {
        Currency customCurrency = Currency.getInstance("USD");
        NumberFormat currency = NumberFormat.getCurrencyInstance(Locale.US);
        currency.setCurrency(customCurrency);
        return currency.format(this.getTotal());

    }
}
