package swp12.gym.controller.admin.api;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import swp12.gym.service.TicketService;

import javax.servlet.http.HttpServletRequest;
import java.time.LocalDate;
import java.util.*;

@RestController
public class TicketAPIOfAdmin {
    @Autowired
    private TicketService ticketService;
    private final String URL_API = "/admin/ticket-management";

    //Create An ticket door
    @PostMapping(value = URL_API+"/add-ticket", produces = "text/plain;charset=UTF-8")
    public ResponseEntity<String> saveTicketDoor(HttpServletRequest request){
        try{
            String name = request.getParameter("_name");
            String price = request.getParameter("_price");
            String day = request.getParameter("_day");
            String day_other = request.getParameter("_day_other");
            String type = request.getParameter("_type");
            int status = 1;
            if(!type.equals("1")){
                status = -1;
            }
            if(price.equals("")){
                price = "0";
            }

            int ids = ticketService.getNumberTicketInSystem() + 1;
            if(day.equals("-1")){
                ticketService.createTicket(name,price,day_other,type, status, ids);
            }else {
                ticketService.createTicket(name,price,day,type,status, ids);
            }
            return new ResponseEntity<String>(ids+"",HttpStatus.OK);
        }catch (Exception e){
            return new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
        }
    }

    //Create An ticket trainer
    @PostMapping(value = URL_API+"/add-ticket-trainer", produces = "text/plain;charset=UTF-8")
    public ResponseEntity<String> saveTicketPersonalTrainer(HttpServletRequest request){
        try{
            Gson gson = new Gson();

            int ids =  ticketService.getNumberTicketInSystem() + 1;
            String name = request.getParameter("_name");
            String price = request.getParameter("_price");
            String day = request.getParameter("_day");
            String day_other = request.getParameter("_day_other");
            String type = request.getParameter("_type");
            String list = request.getParameter("_list");

            if(day.equals("-1")){
                ticketService.createTicket(name,"0",day_other,type, 1, ids);
            }else {
                ticketService.createTicket(name,"0",day,type,1, ids);
            }

            JsonElement jsonElement = gson.fromJson(list, JsonElement.class);
            if (jsonElement.isJsonArray()) {
                JsonArray jsonArray = jsonElement.getAsJsonArray();
                for (JsonElement elem : jsonArray) {
                    JsonObject jsonObject = elem.getAsJsonObject();
                    int id = jsonObject.get("_id").getAsInt();
                    int _price = jsonObject.get("_price").getAsInt();
                    ticketService.createPersonalTicket(id,_price,ids);
                }
            }

            return new ResponseEntity<String>(ids+"",HttpStatus.OK);
        }catch (Exception e){
            e.printStackTrace();
            return new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
        }
    }

    //Delete An Ticket
    @GetMapping(value = URL_API+"/delete/{id}", produces = "text/plain;charset=UTF-8")
    public ResponseEntity<String> deleteTicket(@PathVariable String id){
        try{
            ticketService.deleteTickets(id);
            return new ResponseEntity<String>(HttpStatus.OK);
        }catch (Exception e){
            return new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
        }
    }
}
