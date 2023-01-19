package com.myapps.springbatchjsonreader.domain;

public class Trade {

    private String isin;
    private Integer quantity;
    private Float price;
    private String customer;

    public String getIsin() {
        return isin;
    }

    public void setIsin(String isin) {
        this.isin = isin;
    }

    public Integer getQuantity() {
        return quantity;
    }

    public void setQuantity(Integer quantity) {
        this.quantity = quantity;
    }

    public Float getPrice() {
        return price;
    }

    public void setPrice(Float price) {
        this.price = price;
    }

    public String getCustomer() {
        return customer;
    }

    public void setCustomer(String customer) {
        this.customer = customer;
    }

    @Override
    public String toString() {
        return "Trade{" +
            "isin='" + isin + '\'' +
            ", quantity=" + quantity +
            ", price=" + price +
            ", customer='" + customer + '\'' +
            '}';
    }
}
