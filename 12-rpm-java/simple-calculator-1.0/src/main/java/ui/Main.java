package ui;

import core.Helper;
import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.println("=== Simple Calculator ===");
        System.out.print("Enter first number: ");
        double a = sc.nextDouble();
        System.out.print("Enter operator (+, -, *, /): ");
        char op = sc.next().charAt(0);
        System.out.print("Enter second number: ");
        double b = sc.nextDouble();

        double result = 0;
        switch (op) {
            case '+': result = Helper.add(a, b); break;
            case '-': result = Helper.subtract(a, b); break;
            case '*': result = Helper.multiply(a, b); break;
            case '/': result = Helper.divide(a, b); break;
            default: System.out.println("Invalid operator!"); return;
        }
        System.out.println("Result: " + result);
        sc.close();
    }
}
