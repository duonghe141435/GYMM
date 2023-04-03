package swp12.gym.controller.admin.api;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import swp12.gym.service.TicketService;

import javax.servlet.http.HttpServletRequest;
import java.util.*;

@RestController
public class TicketAPIOfAdmin {

    @Autowired
    private TicketService ticketService;

    private final String URL_API = "/admin/ticket-management";


    //Create An Product
    @PostMapping(value = URL_API + "/add-ticket-door")
    public ResponseEntity<String> saveTicketDoor(HttpServletRequest request) {
        try {
            String name = request.getParameter("ticket_name");
            String price = request.getParameter("ticket_price");
            String day = request.getParameter("ticket_day");

            ticketService.createTicket(name, price, day, 1);

            return new ResponseEntity<String>("Thêm vé thành công", HttpStatus.OK);
        } catch (Exception e) {
            return new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
        }
    }

    @PostMapping(value = URL_API + "/add-ticket-trainer")
    public ResponseEntity<String> saveTicketPersonalTrainer(@RequestBody Map<String, Object> requestMap) {
        try {

            String ticketName = (String) requestMap.get("ticket-name");
            String ticketDay = (String) requestMap.get("ticket-day");
            List<Map<String, String>> listTrainer = (List<Map<String, String>>) requestMap.get("list-trainer");

            System.out.println("ticketName: " + ticketName);
            System.out.println("ticketDay: " + ticketDay);
            System.out.println("listTrainer: " + listTrainer);
            int ids = ticketService.getNumberTicketInSystem() + 1;
            ticketService.createTicketForTrainer(ticketName, ticketDay, 2);

            for (Map<String, String> trainer : listTrainer) {
                String id = trainer.get("trainer-id");
                String price = trainer.get("trainer-price");
                ticketService.createPersonalTicket(id, price, ids);
            }

            return new ResponseEntity<String>("Thêm vé thành công", HttpStatus.OK);
        } catch (Exception e) {
            return new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
        }
    }

    @PostMapping(value = URL_API + "/add-ticket-class")
    public ResponseEntity<String> saveTicketClass(HttpServletRequest request) {
        try {
            String name = request.getParameter("ticket_name");
            String price = request.getParameter("ticket_price");
            String day = request.getParameter("ticket_day");

            ticketService.createTicket(name, price, day, 3);

            return new ResponseEntity<String>("Thêm vé thành công", HttpStatus.OK);
        } catch (Exception e) {
            return new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
        }
    }
}
