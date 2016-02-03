package com.hesc.core.dao;

public class Test {
    public static void greet() {
        System.out.println("hello");
    }

    public static void main(String[] args) {
        ((Test) null).greet();
    }
} 