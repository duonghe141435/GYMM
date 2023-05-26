package swp12.gym.controller.trainer.api;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.web.bind.annotation.*;
import swp12.gym.dao.UsersDao;
import swp12.gym.dto.ClassDto;
import swp12.gym.model.entity.Attendance;
import swp12.gym.model.entity.UserClass;
import swp12.gym.service.*;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

@RestController
public class AttendanceAnClassApi {

    private final String URL_API = "/trainerApi";

    @Autowired
    private AttendanceService attendanceService;


    @PostMapping(value = URL_API + "/attendanceClass")
//    @RequestMapping(value = URL_API + "attendanceClass", method = RequestMethod.POST)
    public ResponseEntity<String> saveAttendance(HttpServletRequest request){
        try{

            Gson gson = new Gson();
            String list = request.getParameter("attendence");
            System.out.println(list);
//            JsonElement jsonElement = gson.fromJson(list, JsonElement.class);
            JsonElement jsonElement = gson.fromJson(list, JsonElement.class);
            List<Attendance> attendance = new ArrayList<Attendance>();
            if (jsonElement.isJsonArray()) {
                JsonArray jsonArray = jsonElement.getAsJsonArray();
                for (JsonElement elem : jsonArray) {
                    JsonObject jsonObject = elem.getAsJsonObject();
//                    String attendance_date = jsonObject.get("_attendance_date").getAsString();
                    int status = jsonObject.get("_status").getAsInt();
                    int user_id = jsonObject.get("_user_id").getAsInt();
                    int class_id = jsonObject.get("_class_id").getAsInt();
                    attendance.add(new Attendance(null, status, user_id, class_id));
                }
            }

            attendanceService.saveAttendance(attendance);
            return new ResponseEntity<String>(HttpStatus.OK);
        }catch (Exception e){
            return new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
        }
    }

    @PostMapping(value = URL_API + "/updateAttendanceClass")
//    @RequestMapping(value = URL_API + "attendanceClass", method = RequestMethod.POST)
    public ResponseEntity<String> updateAttendance(HttpServletRequest request){
        try{
            Gson gson = new Gson();
            String list = request.getParameter("attendence");
            JsonElement jsonElement = gson.fromJson(list, JsonElement.class);
            List<Attendance> attendance = new ArrayList<Attendance>();
            if (jsonElement.isJsonArray()) {
                JsonArray jsonArray = jsonElement.getAsJsonArray();
                for (JsonElement elem : jsonArray) {
                    JsonObject jsonObject = elem.getAsJsonObject();
                    int status = jsonObject.get("_status").getAsInt();
                    int user_id = jsonObject.get("_user_id").getAsInt();
                    int class_id = jsonObject.get("_class_id").getAsInt();
                    attendance.add(new Attendance(null, status, user_id, class_id));
                }
            }

            attendanceService.updateAttendance(attendance);
            return new ResponseEntity<String>(HttpStatus.OK);
        }catch (Exception e){
            return new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
        }
    }

}
