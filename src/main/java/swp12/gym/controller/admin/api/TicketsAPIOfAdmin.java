package swp12.gym.controller.admin.api;

import swp12.gym.model.entity.Ticket;
import swp12.gym.service.TicketService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.util.MimeTypeUtils;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

@RestController()
public class TicketsAPIOfAdmin {

    @Autowired
    private TicketService ticketService;

    private final String URL_API = "/admin/ticket-management";


    //Get An Product
    @GetMapping(value = URL_API+"/{id}",produces = MimeTypeUtils.APPLICATION_JSON_VALUE)
    public ResponseEntity<Ticket> getAnProduct(@PathVariable int id){
        try{
            Ticket ticket = ticketService.findAnTicket(id);
            return new ResponseEntity<Ticket>(ticket,HttpStatus.OK);
        }catch (Exception e){
            return new ResponseEntity<Ticket>(HttpStatus.BAD_REQUEST);
        }
    }

    //Gets a list of Tickets
    @GetMapping(value = URL_API, produces = MimeTypeUtils.APPLICATION_JSON_VALUE)
    public ResponseEntity<List<Ticket>> getsTickets(){

        try{
            List<Ticket> tickets = new ArrayList<Ticket>();
            tickets = ticketService.findAll();
            ResponseEntity<List<Ticket>> responseEntity = new ResponseEntity<List<Ticket>>(tickets,HttpStatus.OK);
            return responseEntity;
        }catch (Exception e){
            return new ResponseEntity<List<Ticket>>(HttpStatus.BAD_REQUEST);
        }
    }

    //Delete An Product
    @DeleteMapping(value = URL_API+"/{id}")
    public ResponseEntity<Ticket> deleteAnProduct(@PathVariable int id){
        try{
//            ticketService.deleteTickets(id);
            return new ResponseEntity<Ticket>(HttpStatus.OK);
        }catch (Exception e){
            return new ResponseEntity<Ticket>(HttpStatus.BAD_REQUEST);
        }
    }



    //Creates a list of Tickets
    @PostMapping(value = URL_API, produces = MimeTypeUtils.APPLICATION_JSON_VALUE)
    public ResponseEntity<List<Ticket>> createTickets(@RequestBody Ticket[] ticket){
        try{
            System.out.println(ticket[0].getT_name());
            ResponseEntity<List<Ticket>> responseEntity = new ResponseEntity<List<Ticket>>(HttpStatus.OK);
            return responseEntity;
        }catch (Exception e){
            return new ResponseEntity<List<Ticket>>(HttpStatus.BAD_REQUEST);
        }
    }



    //Updates a list of Tickets
    @PutMapping(value = URL_API, produces = MimeTypeUtils.APPLICATION_JSON_VALUE)
    public ResponseEntity<List<Ticket>> createTickets(){

        try{
            List<Ticket> tickets = new ArrayList<Ticket>();
            ResponseEntity<List<Ticket>> responseEntity = new ResponseEntity<List<Ticket>>(tickets,HttpStatus.OK);
            return responseEntity;
        }catch (Exception e){
            return new ResponseEntity<List<Ticket>>(HttpStatus.BAD_REQUEST);
        }
    }


//    @GetMapping (value = "/api/tickets" ,produces = { MimeTypeUtils.APPLICATION_JSON_VALUE })
//    public ResponseEntity<List<Product>> demo4() {
//        try {
//            ProductModel productModel = new ProductModel();
//            ResponseEntity<List<Product>> responseEntity = new ResponseEntity<List<Product>>(productModel.findAll(),HttpStatus.OK);
//            return responseEntity;
//        } catch (Exception e) {
//            return new ResponseEntity<List<Product>>(HttpStatus.BAD_REQUEST);
//        }
//    }
//
//    @GetMapping(value = "/api/ajaxrest/demo3", produces = { MimeTypeUtils.APPLICATION_JSON_VALUE })
//    public ResponseEntity<Product> demo3() {
//        try {
//            ProductModel productModel = new ProductModel();
//            ResponseEntity<Product> responseEntity = new ResponseEntity<Product>(productModel.find(), HttpStatus.OK);
//            return responseEntity;
//        } catch (Exception e) {
//            return new ResponseEntity<Product>(HttpStatus.BAD_REQUEST);
//        }
//    }
//
//    @PostMapping(value = "/api/ajaxrest/demo1", produces = { MimeTypeUtils.APPLICATION_JSON_VALUE })
//    public ResponseEntity<List<Product>> demo1(@RequestBody Product product) {
//        try {
//            ProductModel productModel = new ProductModel();
//            List<Product> products = productModel.findAll();
//
//            ResponseEntity<List<Product>> responseEntity = new ResponseEntity<List<Product>>(productModel.findAll(), HttpStatus.OK);
//            return responseEntity;
//        } catch (Exception e) {
//            return new ResponseEntity<List<Product>>(HttpStatus.BAD_REQUEST);
//        }
//    }
//
//    @PutMapping (value = "/api/ajaxrest/demo2", produces = { MimeTypeUtils.APPLICATION_JSON_VALUE })
//    public ResponseEntity<List<Product>> demo2(@RequestBody Product product) {
//        try {
//            List<Product> products = new ArrayList<Product>();
//            products.add(product);
//            products.add(new Product("1","2",2000));
//            ResponseEntity<List<Product>> responseEntity = new ResponseEntity<List<Product>>(products, HttpStatus.OK);
//            return responseEntity;
//        } catch (Exception e) {
//            return new ResponseEntity<List<Product>>(HttpStatus.BAD_REQUEST);
//        }
//    }
}
