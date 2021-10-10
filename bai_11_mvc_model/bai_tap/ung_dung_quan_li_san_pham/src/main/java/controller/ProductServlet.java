package controller;

import model.bean.Product;
import model.service.Impl.ProductServiceImpl;
import model.service.ProductService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "ProductServlet", value = {"","/product"})
public class ProductServlet extends HttpServlet {
    private static ProductService productService = new ProductServiceImpl();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if(action == null){
            action = "";
        }
        switch (action){
            case "create":
                createProduct(request,response);
                break;
            case "update":
                updateProduct(request,response);
                break;
            case "delete":
                deleteProduct(request,response);
                break;
            case "view":
                break;
            default:
                showListProduct(request,response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if(action == null){
            action = "";
        }
        switch (action){
            case "create":
                showCreateProduct(request,response);
                break;
            case "update":
                showUpdateProduct(request,response);
                break;
            case "view":
                viewProduct(request,response);
                break;
            default:
                showListProduct(request,response);
        }
    }
    private void showListProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{

            request.setAttribute("listProduct",productService.findAll());
            request.getRequestDispatcher("/product/list.jsp").forward(request, response);
    }
    private void showCreateProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        request.getRequestDispatcher("/product/create.jsp").forward(request,response);
    }
    private void createProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        Double price = Double.parseDouble(request.getParameter("price"));
        String producer = request.getParameter("producer");
        Product product = new Product(id,name,price,producer);
        productService.save(product);
        showListProduct(request,response);
    }
    private void showUpdateProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Product product = productService.findById(id);
        request.setAttribute("product",product);
        request.getRequestDispatcher("/product/update.jsp").forward(request,response);

    }
    private void updateProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        Double price = Double.parseDouble(request.getParameter("price"));
        String producer = request.getParameter("producer");
        Product product = productService.findById(id);
        product.setName(name);
        product.setPrice(price);
        product.setProducer(producer);
        showListProduct(request,response);

    }
    private  void  deleteProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        productService.remove(id);
        showListProduct(request,response);
    }
    private void viewProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Product product = productService.findById(id);
        request.setAttribute("product",product);
        request.getRequestDispatcher("/product/view.jsp").forward(request,response);
    }
}
