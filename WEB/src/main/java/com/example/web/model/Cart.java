package com.example.web.model;

import java.util.TreeMap;

public class Cart {
    private TreeMap<Product, Integer> list;
    private long cartId;

    public Cart() {
        list = new TreeMap<>();
        cartId = System.currentTimeMillis();
    }

    public Cart(TreeMap<Product, Integer> list, long cartId) {
        this.list = list;
        this.cartId = cartId;
    }

    public TreeMap<Product, Integer> getList() {
        return list;
    }

    public void setList(TreeMap<Product, Integer> list) {
        this.list = list;
    }

    public long getCartId() {
        return cartId;
    }

    public void setCartId(long cartId) {
        this.cartId = cartId;
    }

    public void insertToCart (Product product, int quantity) {
        boolean bln = list.containsKey(product);
        if (bln) {
            int addition = list.get(product);
            quantity += addition;
            list.put(product, quantity);
        } else {
            list.put(product, quantity);
        }
    }
}
