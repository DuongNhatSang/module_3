import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "HomePageServlet",value = "/home")
public class HomePageServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            String productDescription = request.getParameter("ProductDescription");
            double listPrice = Double.parseDouble(request.getParameter("ListPrice"));
            double discountPercent = Double.parseDouble(request.getParameter("DiscountPercent"));
            double discountAmount = listPrice * discountPercent * 0.01;
            double discountPrice = listPrice - discountAmount;
            request.setAttribute("discountAmount",discountAmount);
            request.setAttribute("discountPrice",discountPrice);
            request.getRequestDispatcher("final.jsp").forward(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
