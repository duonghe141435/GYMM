package swp12.gym.controller.admin.api;

import swp12.gym.dao.UnitDao;
import swp12.gym.model.entity.Unit;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.util.MimeTypeUtils;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

@RestController
public class UnitAPIOfAdmin {
    private final String URL_API = "/admin/api/unit";

    @Autowired
    private UnitDao unitDao;

    //Gets a list of Unit
    @GetMapping(value = URL_API , produces = MimeTypeUtils.APPLICATION_JSON_VALUE)
    public ResponseEntity<List<Unit>> getsProduct(){

        try{
            List<Unit> units = new ArrayList<Unit>();
            units = unitDao.getListUnitDemo();
            ResponseEntity<List<Unit>> responseEntity = new ResponseEntity<List<Unit>>(units, HttpStatus.OK);
            return responseEntity;
        }catch (Exception e){
            return new ResponseEntity<List<Unit>>(HttpStatus.BAD_REQUEST);
        }
    }

    //Create multiple Product
    @PostMapping(value = URL_API, produces = MimeTypeUtils.APPLICATION_JSON_VALUE)
    public ResponseEntity<Unit> createProduct(){
        return null;
    }

    //Update multiple
    @PutMapping(value = URL_API, produces = MimeTypeUtils.APPLICATION_JSON_VALUE)
    public ResponseEntity<List<Unit>> UpdateDataOfProduct(@RequestBody Unit product){
        try{
            return new ResponseEntity<List<Unit>>(HttpStatus.OK);
        }catch (Exception e){
            return new ResponseEntity<List<Unit>>(HttpStatus.BAD_REQUEST);
        }

    }

    //Delete multiple
    @DeleteMapping(value = URL_API, produces = MimeTypeUtils.APPLICATION_JSON_VALUE)
    public ResponseEntity<List<Unit>> DeleteProduct(@RequestBody int[] id){
        try{
            return new ResponseEntity<List<Unit>>(HttpStatus.OK);
        }catch (Exception e){
            return new ResponseEntity<List<Unit>>(HttpStatus.BAD_REQUEST);
        }
    }


    //Get An Product
    @GetMapping(value = URL_API+"/{id}",produces = MimeTypeUtils.APPLICATION_JSON_VALUE)
    public ResponseEntity<Unit> getAnProduct(@PathVariable long id){
        try{
            return new ResponseEntity<Unit>(HttpStatus.OK);
        }catch (Exception e){
            return new ResponseEntity<Unit>(HttpStatus.BAD_REQUEST);
        }
    }

    //Create An Product
    @PostMapping(value = URL_API+"/{id}",produces = MimeTypeUtils.APPLICATION_JSON_VALUE)
    public ResponseEntity<Unit> createAnProduct(@PathVariable long id){
        try{
            return new ResponseEntity<Unit>(HttpStatus.OK);
        }catch (Exception e){
            return new ResponseEntity<Unit>(HttpStatus.BAD_REQUEST);
        }
    }

    //Update An Product
    @PutMapping(value = URL_API+"/{id}",produces = MimeTypeUtils.APPLICATION_JSON_VALUE)
    public ResponseEntity<Unit> updateAnProduct(@PathVariable long id){
        try{
            return new ResponseEntity<Unit>(HttpStatus.OK);
        }catch (Exception e){
            return new ResponseEntity<Unit>(HttpStatus.BAD_REQUEST);
        }
    }

    //Delete An Product
    @DeleteMapping(value = URL_API+"/{id}",produces = MimeTypeUtils.APPLICATION_JSON_VALUE)
    public ResponseEntity<Unit> deleteAnProduct(@PathVariable long id){
        try{
            return new ResponseEntity<Unit>(HttpStatus.OK);
        }catch (Exception e){
            return new ResponseEntity<Unit>(HttpStatus.BAD_REQUEST);
        }
    }
}
