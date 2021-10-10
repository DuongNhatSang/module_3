package model.repository.Impl;

import model.bean.Product;
import model.repository.ProductRepository;

import java.util.ArrayList;
import java.util.List;

public class ProductRepositoryImpl implements ProductRepository {
    private static List<Product> productList = new ArrayList<>();
    static {
        productList.add(new Product(1,"Vở",10000.0,"ABC"));
        productList.add(new Product(2,"Sách",40000.0,"ABC"));
        productList.add(new Product(3,"Bút",20000.0,"ZYZ"));
        productList.add(new Product(4,"Thước",5000.0,"ABC"));
        productList.add(new Product(5,"Tẩy",3000.0,"ACC"));
    }
    @Override
    public List<Product> findAll() {
        return productList;
    }

    @Override
    public void save(Product product) {
productList.add(product);
    }

    @Override
    public Product findById(int id) {
        Product product = null;
        for (int i = 0; i < productList.size(); i++) {
            if(productList.get(i).getId() == id){
                 product = productList.get(i);
            }
        }
        return product;
    }

    @Override
    public void update(int id, Product product) {
        productList.add(id,product);
    }

    @Override
    public void remove(int id) {
        productList.remove(id);
    }
}
