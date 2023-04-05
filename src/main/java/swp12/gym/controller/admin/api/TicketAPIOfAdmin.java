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
    @PostMapping(value = URL_API+"/add-ticket-door", produces = "text/plain;charset=UTF-8")
    public ResponseEntity<String> saveTicketDoor(HttpServletRequest request){
        try{
            String name = request.getParameter("_name");
            String price = request.getParameter("_price");
            String day = request.getParameter("_day");
            String day_other = request.getParameter("_day_other");

            int ids = ticketService.getNumberTicketInSystem() + 1;
            if(day.equals("-1")){
                ticketService.createTicket(name,price,day_other,1, ids);
            }else {
                ticketService.createTicket(name,price,day,1, ids);
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
            String day = request.getParameter("_day");
            String day_other = request.getParameter("_day_other");
            String list = request.getParameter("_list");

            JsonElement jsonElement = gson.fromJson(list, JsonElement.class);

            //Tao vé trước khi thêm Trainer
            if(day.equals("-1")){
                ticketService.createTicket(name,"0",day_other,2, ids);
            }else {
                ticketService.createTicket(name,"0",day,2, ids);
            }
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

    //Create An ticket class
    @PostMapping(value = URL_API+"/add-ticket-class")
    public ResponseEntity<String> saveTicketClass(HttpServletRequest request){
        try{
            Gson gson = new Gson();

            int ids =  ticketService.getNumberTicketInSystem() + 1;
            int ids_class =  ticketService.getNumberTicketTrainerInSystem() + 1;
            int ids_weekdays =  ticketService.getNumberClassWeekendInSystem() + 1;

            String name = request.getParameter("_name");
            String day = request.getParameter("_day");
            String day_other = request.getParameter("_day_other");
            String list = request.getParameter("_list");

            String add_date = "";

            if(day.equals("-1")){ add_date = day_other; }else { add_date = day; }

            ticketService.createTicket(name,"0",add_date,3, ids);
            JsonElement jsonElement = gson.fromJson(list, JsonElement.class);

            if (jsonElement.isJsonArray()) {
                JsonArray jsonArray = jsonElement.getAsJsonArray();
                for (JsonElement elem : jsonArray) {

                    JsonObject jsonObject = elem.getAsJsonObject();
                    int id_trainer = jsonObject.get("_id").getAsInt();
                    int _price = jsonObject.get("_price").getAsInt();
                    int _max_member = jsonObject.get("_max_member").getAsInt();
                    int _id_time = jsonObject.get("_id_time").getAsInt();
                    String start_date = jsonObject.get("_start_date").getAsString();
                    int state = jsonObject.get("_state").getAsInt();
                    String check = jsonObject.get("_check").getAsString();

                    LocalDate date = LocalDate.parse(start_date).plusDays(Integer.parseInt(add_date));
                    System.out.println(date.toString());

                    int cn = 0, thu2 = 0, thu3 = 0, thu4 = 0, thu5 = 0, thu6 = 0,thu7 = 0;
                    String[] arr = gson.fromJson(check, String[].class);
                    for (String s : arr) {
                        if(s.equals("1")){
                            cn = 1;
                        }
                        if(s.equals("2")){
                            thu2 = 1;
                        }
                        if(s.equals("3")){
                            thu3 = 1;
                        }
                        if(s.equals("4")){
                            thu4 = 1;
                        }
                        if(s.equals("5")){
                            thu5 = 1;
                        }
                        if(s.equals("6")){
                            thu6 = 1;
                        }
                        if(s.equals("7")){
                            thu7 = 1;
                        }
                    }
                    ticketService.createTicketClass(ids_class,id_trainer,ids,_id_time,state,start_date,date.toString(),_max_member,_price);
                    ticketService.createClassWeekdays(ids_weekdays,cn,thu2,thu3,thu4,thu5,thu6,thu7,ids_class);
                    ids_class++;ids_weekdays++;
                }
            }
            return new ResponseEntity<String>(ids+"",HttpStatus.OK);
        }catch (Exception e){
            return new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
        }
    }

    //Delete An Ticket
    @PostMapping(value = URL_API)
    public ResponseEntity<String> deleteTicket(HttpServletRequest request){
        try{
            String id = request.getParameter("_id");
            ticketService.deleteTickets(id);
            return new ResponseEntity<String>(HttpStatus.OK);
        }catch (Exception e){
            return new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
        }
    }
}
