package swp12.gym.controller.admin.api;

import org.springframework.http.MediaType;
import swp12.gym.dto.TicketDto;
import swp12.gym.model.entity.Ticket;
import swp12.gym.service.TicketService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.util.MimeTypeUtils;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

@RestController()
public class TicketsAPIOfAdmin {

    @Autowired
    private TicketService ticketService;

    private final String URL_API = "/admin/ticket-management";

    //Get An Ticket
    @GetMapping(value = URL_API + "/{id}", produces = MimeTypeUtils.APPLICATION_JSON_VALUE)
    public ResponseEntity<TicketDto> getAnProduct(@PathVariable int id) {
        try {
            TicketDto ticket = ticketService.findAnTicket(id);
            return new ResponseEntity<TicketDto>(ticket, HttpStatus.OK);
        } catch (Exception e) {
            return new ResponseEntity<TicketDto>(HttpStatus.BAD_REQUEST);
        }
    }

    //Update An Product
//    @PutMapping(value = URL_API + "/{id}", produces = MimeTypeUtils.APPLICATION_JSON_VALUE)
//    public ResponseEntity<Ticket> updateAnProduct(@RequestBody Ticket ticket, @PathVariable int id) {
//        try {
//            ticketService.updateTickets(ticket, id);
//            return new ResponseEntity<Ticket>(HttpStatus.OK);
//        } catch (Exception e) {
//            return new ResponseEntity<Ticket>(HttpStatus.BAD_REQUEST);
//        }
//    }


    //Create An Product
    @PutMapping(value = URL_API,produces = MimeTypeUtils.APPLICATION_JSON_VALUE)
    public ResponseEntity<TicketDto> updateAnProduct(@RequestBody TicketDto ticketDto) {
        try {

            Ticket ticket = new Ticket();
            ticket.setT_id(ticketDto.getT_id());
            ticket.setT_name(ticketDto.getT_name());
            ticket.setT_price(ticketDto.getT_price());
            ticket.setT_total_days(ticketDto.getT_total_days());
            ticket.setTt_id(ticketDto.getTt_id());
            ticket.setT_note(ticketDto.getT_note());

            ticketService.updateTickets(ticket);

            return new ResponseEntity<TicketDto>(ticketDto,HttpStatus.OK);
        } catch (Exception e) {
            return new ResponseEntity<TicketDto>(HttpStatus.BAD_REQUEST);
        }
    }

    //Create An Product
    @PostMapping(value = URL_API)
    public ResponseEntity<String> createAnProduct(HttpServletRequest request) {
        try {
            String t_name = request.getParameter("t_name");
            int tt_id = Integer.parseInt(request.getParameter("tt_id"));
            String t_note = request.getParameter("t_note");
            int t_price = Integer.parseInt(request.getParameter("t_price"));
            int t_day = Integer.parseInt(request.getParameter("t_total_days"));
            String create_date = request.getParameter("create_date");

            int id_t = ticketService.getNumberTicketInSystem() + 1;
            Ticket ticket = new Ticket();
            ticket.setT_id(id_t);
            ticket.setT_note(t_note);
            ticket.setT_name(t_name);
            ticket.setT_total_days(t_day);
            ticket.setCreate_date(create_date);
            ticket.setT_price(t_price);
            ticket.setTt_id(tt_id);

            ticketService.createTicket(ticket);
            return new ResponseEntity<String>(id_t+"",HttpStatus.OK);
        } catch (Exception e) {
            return new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
        }
    }

    //Gets a list of Tickets
    @GetMapping(value = URL_API, produces = MimeTypeUtils.APPLICATION_JSON_VALUE)
    public ResponseEntity<List<TicketDto>> getsTickets() {

        try {
            List<TicketDto> tickets = ticketService.findAll();
            return new ResponseEntity<List<TicketDto>>(tickets, HttpStatus.OK);
        } catch (Exception e) {
            return new ResponseEntity<List<TicketDto>>(HttpStatus.BAD_REQUEST);
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
