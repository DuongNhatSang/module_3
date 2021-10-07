import model.Calculator;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "calculatorServlet",value = "/calculator")
public class calculatorServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        float firstOperand = Integer.parseInt(request.getParameter("firsrOperand"));
        float secondOperand = Integer.parseInt(request.getParameter("secondOperand"));
        String operator = request.getParameter("operator");
        request.setAttribute("firsrOperand",firstOperand);
        request.setAttribute("secondOperand",secondOperand);
        request.setAttribute("operator",operator);
        try {
            float result = Calculator.calculator(firstOperand,secondOperand,operator);
            request.setAttribute("result",result);
            request.getRequestDispatcher("final.jsp").forward(request,response);
        }catch (Exception ex){
            String err = "Error: " + ex.getMessage();
            request.setAttribute("err",err);
            request.getRequestDispatcher("final.jsp").forward(request,response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
