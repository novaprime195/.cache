#!/usr/bin/env python3
# Simple Arithmetic Operations Calculator

def add(a, b):
    return a + b

def subtract(a, b):
    return a - b

def multiply(a, b):
    return a * b

def divide(a, b):
    if b != 0:
        return a / b
    else:
        return "Cannot divide by zero!"

def main():
    print("=== Simple Calculator ===")
    
    # Get numbers from user
    try:
        num1 = float(input("Enter first number: "))
        num2 = float(input("Enter second number: "))
        
        # Perform all operations
        print(f"\nResults for {num1} and {num2}:")
        print(f"Addition: {num1} + {num2} = {add(num1, num2)}")
        print(f"Subtraction: {num1} - {num2} = {subtract(num1, num2)}")
        print(f"Multiplication: {num1} × {num2} = {multiply(num1, num2)}")
        print(f"Division: {num1} ÷ {num2} = {divide(num1, num2)}")
        
    except ValueError:
        print("Please enter valid numbers!")

if __name__ == "__main__":
    main()
