package com.example.ck.model;


public class Product {
    private int id;
    private String name;
    private double price;
    private int quantity;
    private String color;
    private String moTa;
    private Category categoryId;
    private int id_category;

    public Product() {
    }

    public Product(int id, String name, double price, int quantity, String color, int id_category) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.quantity = quantity;
        this.color = color;
        this.id_category = id_category;
    }

    public Product(String name, double price, int quantity, String color, String moTa, Category categoryId, int id_category) {
        this.name = name;
        this.price = price;
        this.quantity = quantity;
        this.color = color;
        this.moTa = moTa;
        this.categoryId = categoryId;
        this.id_category = id_category;
    }

    public Product(String name, double price, int quantity, String color, String moTa, Category categoryId) {
        this.name = name;
        this.price = price;
        this.quantity = quantity;
        this.color = color;
        this.moTa = moTa;
        this.categoryId = categoryId;
    }

    public Product(int id, String name, double price, int quantity, String color, String moTa, int id_category) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.quantity = quantity;
        this.color = color;
        this.moTa = moTa;
        this.id_category = id_category;
    }

    public Product(int id, String name, double price, int quantity, String color, String moTa, Category categoryId) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.quantity = quantity;
        this.color = color;
        this.moTa = moTa;
        this.categoryId = categoryId;
    }

    public Product(String name, double price, int quantity, String color, String moTa, int id_category) {
        this.name = name;
        this.price = price;
        this.quantity = quantity;
        this.color = color;
        this.moTa = moTa;
        this.id_category = id_category;
    }

    public Product(int id, String name, double price, int quantity, String color, String moTa, Category categoryId, int id_category) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.quantity = quantity;
        this.color = color;
        this.moTa = moTa;
        this.categoryId = categoryId;
        this.id_category = id_category;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public String getMoTa() {
        return moTa;
    }

    public void setMoTa(String moTa) {
        this.moTa = moTa;
    }

    public Category getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(Category categoryId) {
        this.categoryId = categoryId;
    }

    public int getId_category() {
        return id_category;
    }

    public void setId_category(int id_category) {
        this.id_category = id_category;
    }
}