package swp12.gym.controller.admin.api;

import swp12.gym.dao.ProductDao;
import swp12.gym.model.entity.Product;
import swp12.gym.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.util.MimeTypeUtils;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

@RestController
public class ProductAPIOfAdmin {

    private final String URL_API = "/admin/product-management";

    @Autowired
    private ProductService productService;

    @Autowired
    private ProductDao productDao;

    //Gets a list of Product
    @GetMapping(value = URL_API , produces = MimeTypeUtils.APPLICATION_JSON_VALUE)
    public ResponseEntity<List<Product>> getsProduct(){

        try{
            List<Product> products = new ArrayList<Product>();
            products = productService.findAll();
            ResponseEntity<List<Product>> responseEntity = new ResponseEntity<List<Product>>(products, HttpStatus.OK);
            return responseEntity;
        }catch (Exception e){
            return new ResponseEntity<List<Product>>(HttpStatus.BAD_REQUEST);
        }
    }

    //Create multiple Product
    @PostMapping(value = URL_API, produces = MimeTypeUtils.APPLICATION_JSON_VALUE)
    public ResponseEntity<Product> createProduct(){
        return null;
    }

    //Update multiple
    @PutMapping(value = URL_API, produces = MimeTypeUtils.APPLICATION_JSON_VALUE)
    public ResponseEntity<List<Product>> UpdateDataOfProduct(@RequestBody Product product){
        try{
            return new ResponseEntity<List<Product>>(HttpStatus.OK);
        }catch (Exception e){
            return new ResponseEntity<List<Product>>(HttpStatus.BAD_REQUEST);
        }

    }

    //Delete multiple
    @DeleteMapping(value = URL_API, produces = MimeTypeUtils.APPLICATION_JSON_VALUE)
    public ResponseEntity<List<Product>> DeleteProduct(@RequestBody int[] id){
        try{
            return new ResponseEntity<List<Product>>(HttpStatus.OK);
        }catch (Exception e){
            return new ResponseEntity<List<Product>>(HttpStatus.BAD_REQUEST);
        }
    }


    //Get An Product
    @GetMapping(value = URL_API+"/{id}",produces = MimeTypeUtils.APPLICATION_JSON_VALUE)
    public ResponseEntity<Product> getAnProduct(@PathVariable int id){
        try{
            Product product = new Product();
            product = productService.findAnProduct(id);
            return new ResponseEntity<Product>(product,HttpStatus.OK);
        }catch (Exception e){
            return new ResponseEntity<Product>(HttpStatus.BAD_REQUEST);
        }
    }

    //Update An Product
    @PutMapping(value = URL_API+"/{id}",produces = MimeTypeUtils.APPLICATION_JSON_VALUE)
    public ResponseEntity<Product> updateAnProduct(@RequestBody Product product){
        try{
            productService.updateProduct(product);
            return new ResponseEntity<Product>(HttpStatus.OK);
        }catch (Exception e){
            return new ResponseEntity<Product>(HttpStatus.BAD_REQUEST);
        }
    }

    //Create An Product
    @PostMapping(value = URL_API+"/{id}",produces = MimeTypeUtils.APPLICATION_JSON_VALUE)
    public ResponseEntity<Product> createAnProduct(@PathVariable long id){
        try{
            return new ResponseEntity<Product>(HttpStatus.OK);
        }catch (Exception e){
            return new ResponseEntity<Product>(HttpStatus.BAD_REQUEST);
        }
    }



    //Delete An Product
    @DeleteMapping(value = URL_API+"/{id}",produces = MimeTypeUtils.APPLICATION_JSON_VALUE)
    public ResponseEntity<Product> deleteAnProduct(@PathVariable long id){
        try{
            return new ResponseEntity<Product>(HttpStatus.OK);
        }catch (Exception e){
            return new ResponseEntity<Product>(HttpStatus.BAD_REQUEST);
        }
    }
}
