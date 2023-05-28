package swp12.gym.controller.admin.api;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;
import swp12.gym.service.ProductTypeService;
import swp12.gym.service.UnitService;

@RestController
public class ProductAPIOfAdmin {


    private final String URL_API = "/admin/product-management";

    @Autowired
    private ProductTypeService productTypeService;
    @Autowired
    private UnitService unitService;

    @PostMapping(value = URL_API+"/type", produces = "text/plain;charset=UTF-8")
    public ResponseEntity<String> createProductType(@RequestBody String type) {
        try {
            int id = productTypeService.getMaxIdKindInSystem() + 1;
            productTypeService.createProductType(id,type);
            return new ResponseEntity<String>(id+"", HttpStatus.OK);
        } catch (Exception e) {
            return new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
        }
    }


    //Gets a list of Unit
    @PostMapping(value = URL_API+"/unit", produces = "text/plain;charset=UTF-8")
    public ResponseEntity<String> createUnit(@RequestBody String type) {
        try {
            int id = unitService.getTotalItemInSystem() + 1;
            unitService.createUnit(id,type);
            return new ResponseEntity<String>(id+"",HttpStatus.OK);
        } catch (Exception e) {
            return new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
        }
    }
}

