package swp12.gym.controller.employee.api;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.util.MimeTypeUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import swp12.gym.dto.ProductDto;
import swp12.gym.service.ProductService;

import java.util.List;

@RestController
public class ProductAPIOfEmployee {
    private final String URL_API = "/employee/product-management";
    @Autowired
    private ProductService productService;

    //Get An Product
    @GetMapping(value = URL_API+"/search", produces = MimeTypeUtils.APPLICATION_JSON_VALUE)
    public ResponseEntity<List<ProductDto>> search(@RequestParam(name = "query") String query, Model model){
        try{
            System.out.println(query);
            List<ProductDto> results = productService.searchProduct(query);
            return new ResponseEntity<List<ProductDto>>(results, HttpStatus.OK);
        }catch (Exception e){
            e.printStackTrace();
            return new ResponseEntity<List<ProductDto>>(HttpStatus.BAD_REQUEST);
        }
    }
}
