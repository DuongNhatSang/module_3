package model;

public class Calculator {
    public static float calculator (float firsrOperand, float secondOperand, String operator){
        switch (operator){
            case "+":
                return firsrOperand + secondOperand;

            case "-":
                return firsrOperand - secondOperand;

            case "*":
                return firsrOperand * secondOperand;

            case "/":
                if(secondOperand != 0) {
                    return firsrOperand / secondOperand;
                }else {
                    throw new RuntimeException("Can't divide by zero");
                }
            default:
                throw new RuntimeException("Invalid operation");

        }
    }
}
