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

    //Get An Ticket
    @GetMapping(value = URL_API + "/{id}", produces = MimeTypeUtils.APPLICATION_JSON_VALUE)
    public ResponseEntity<Ticket> getAnProduct(@PathVariable int id) {
        try {
            Ticket ticket = ticketService.findAnTicket(id);
            return new ResponseEntity<Ticket>(ticket, HttpStatus.OK);
        } catch (Exception e) {
            return new ResponseEntity<Ticket>(HttpStatus.BAD_REQUEST);
        }
    }

    //Update An Product
    @PutMapping(value = URL_API + "/{id}", produces = MimeTypeUtils.APPLICATION_JSON_VALUE)
    public ResponseEntity<Ticket> updateAnProduct(@RequestBody Ticket ticket, @PathVariable int id) {
        try {
            ticketService.updateTickets(ticket, id);
            return new ResponseEntity<Ticket>(HttpStatus.OK);
        } catch (Exception e) {
            return new ResponseEntity<Ticket>(HttpStatus.BAD_REQUEST);
        }
    }


    //Create An Product
    @PostMapping(value = URL_API, produces = MimeTypeUtils.APPLICATION_JSON_VALUE)
    public ResponseEntity<Ticket> createAnProduct(@RequestBody Ticket ticket) {
        try {
            int id_t = ticketService.getNumberTicketInSystem();
            ticket.setT_id(id_t + 1);
            ticketService.createTicket(ticket);
            return new ResponseEntity<Ticket>(HttpStatus.OK);
        } catch (Exception e) {
            return new ResponseEntity<Ticket>(HttpStatus.BAD_REQUEST);
        }
    }

    //Gets a list of Tickets
    @GetMapping(value = URL_API, produces = MimeTypeUtils.APPLICATION_JSON_VALUE)
    public ResponseEntity<List<Ticket>> getsTickets() {

        try {
            List<Ticket> tickets = new ArrayList<Ticket>();
            tickets = ticketService.findAll();
            ResponseEntity<List<Ticket>> responseEntity = new ResponseEntity<List<Ticket>>(tickets, HttpStatus.OK);
            return responseEntity;
        } catch (Exception e) {
            return new ResponseEntity<List<Ticket>>(HttpStatus.BAD_REQUEST);
        }
    }

    //Delete An Product
    @DeleteMapping(value = URL_API + "/{id}")
    public ResponseEntity<Ticket> deleteAnProduct(@PathVariable int id) {
        try {
            ticketService.deleteTickets(id);
            return new ResponseEntity<Ticket>(HttpStatus.OK);
        } catch (Exception e) {
            return new ResponseEntity<Ticket>(HttpStatus.BAD_REQUEST);
        }
    }
}
