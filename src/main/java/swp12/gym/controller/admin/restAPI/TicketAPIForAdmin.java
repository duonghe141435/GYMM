package swp12.gym.controller.admin.restAPI;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.annotation.Secured;
import org.springframework.web.bind.annotation.*;
import sun.security.krb5.internal.Ticket;
import swp12.gym.model.Entity.Tickets;
import swp12.gym.model.Entity.Users;
import swp12.gym.service.TicketService;
import swp12.gym.service.UserService;

import java.util.ArrayList;
import java.util.List;

@RestController
@Secured("ROLE_ADMIN")
public class TicketAPIForAdmin {

    @Autowired
    private TicketService ticketService;

    @PostMapping(value = "/admin/dashboard/tickets/savesave", consumes = {"application/xml","application/json"})
    public ResponseEntity<Tickets> createTicket(@RequestBody Tickets tickets){
        int lastIndex = ticketService.getNumberUserInSystem();
        return new ResponseEntity<Tickets>(HttpStatus.OK);
    }

    @GetMapping(value = "/admin/dashboard/tickets/{id}")
    public Tickets getDataOfTicket(@PathVariable long id){
        return ticketService.findById(id);
    }

//    @GetMapping(value = "/api/tickets")
//    public List<Tickets> findAllTicketIsActive(){
//        return ticketService.findAllTicketIsActive();
//    }
//
//
//    @PutMapping("/admin/dashboard/tickets/{id}")
//    public void UpdateDataOfTicket(@RequestBody Tickets ticket){
//        ticketService.createTicket(ticket);
//    }
//
//    @DeleteMapping()
//    public void deleteTicket(){ }
}
