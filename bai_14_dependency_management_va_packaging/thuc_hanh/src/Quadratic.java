public class Quadratic {
    public static void main(String[] args) {

    }
    public static String calculate(double number1, double number2,double number3){
        double denta = number2*number2 - 4*number1*number3;
        String string = "";
        if(denta < 0){
            string = "phương trình vô nghiệm";
        }else if(denta == 0){
            double x = -number2/(2*number1);
            string = "phương trình có nghiệm kép x1 = x2 = " + x;
        }else {
            double x1 = (-number2 + Math.sqrt(denta)) / (2 * number1);
            double x2 = (-number2 - Math.sqrt(denta)) / (2 * number1);
            string = "phương trình có 2 nghiệm x1 = " + x1 + ", x2 = " + x2;
        }
        return string;
    }
}
