package swp12.gym.controller.admin.api;

import com.google.gson.Gson;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;
import swp12.gym.common.DataUtil;
import swp12.gym.service.ClassService;
import swp12.gym.service.TicketService;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.List;

@RestController
public class ClassAPIOfAdmin {
    private final String URL_API = "/admin/class-management";

    @Autowired
    private ClassService classService;
    @Autowired
    private DataUtil dataUtil;
    @Autowired
    private TicketService ticketService;


    @PostMapping(value = URL_API+"/check-class-exist", produces = "text/plain;charset=UTF-8")
    public ResponseEntity<String> createProductType(HttpServletRequest request) {
        Gson gson = new Gson();
        String error = "true-Thêm lớp thành công";
        try {
            String ticket_id = request.getParameter("_ticket");
            String time_id = request.getParameter("_time");
            String trainer_id = request.getParameter("_trainer");
            String date = request.getParameter("_date");
            String end_date = request.getParameter("end_date");
            String schedule = request.getParameter("schedule");
            String class_name = request.getParameter("_name");
            int price = Integer.parseInt(request.getParameter("_price"));
            int max_member = Integer.parseInt(request.getParameter("_max_menber"));

            int id_class = classService.getMaxIdClassInSystem() + 1;

            //lấy danh sách các ngày cũng lịch biểu của tất cả
            // lớp học vào slot time_id, của ticket_id của trainer_id
            List<String[]> check_class = classService.findScheduleCheckClass(ticket_id,trainer_id,time_id);
            List<Date> dateList = new ArrayList<Date>();
            //Lây dữ liệu - kiểm tra xem có bất kỳ lớp nào lịch book vào slot này hay không
            String monday = "0";
            String tuesday = "0";
            String wednesday = "0";
            String thursday = "0";
            String friday = "0";
            String saturday = "0";
            String sunday = "0";

            for (String[] s : check_class){
                for (int i = 0; i < check_class.size(); i++){
                    dateList.add(dataUtil.convertStringDateToDate(s[1]));
                    if(s[2].equals("1")){ monday = "1"; }
                    if(s[3].equals("1")){ tuesday = "1"; }
                    if(s[4].equals("1")){ wednesday = "1"; }
                    if(s[5].equals("1")){ thursday = "1"; }
                    if(s[6].equals("1")){ friday = "1"; }
                    if(s[7].equals("1")){ saturday = "1"; }
                    if(s[8].equals("1")){ sunday = "1"; }
                }
            }

            String[] arr_schedule = gson.fromJson(schedule, String[].class);
            //Nếu không tồn tại bất kỳ 1 lớp nào thì thêm mới lớp đó
            if(check_class.size() == 0){
                classService.createNewClass(id_class,class_name, time_id, 0, date, end_date, trainer_id,
                        ticket_id, max_member,price, dataUtil.getDateNowToString());
                classService.createClassWeekdays(arr_schedule[6], arr_schedule[0], arr_schedule[1]
                        , arr_schedule[2], arr_schedule[3],arr_schedule[4], arr_schedule[5], id_class);
                ticketService.updateStatusTicket(ticket_id);
            }else {
                //Nếu tồn tại
                //B1: tìm ngày end date lớn nhất của lớp học
                Date start_class_date = dataUtil.convertStringDateToDate(date);
                Date max_date = Collections.max(dateList);
                //B2: So sanh với ngày bắt đầu lớp học muốn thêm vào
                if(start_class_date.compareTo(max_date) > 0){
                    classService.createNewClass(id_class, class_name, time_id, 0, date, end_date, trainer_id,
                            ticket_id, max_member,price, dataUtil.getDateNowToString());
                    classService.createClassWeekdays(arr_schedule[6], arr_schedule[0], arr_schedule[1]
                            , arr_schedule[2], arr_schedule[3],arr_schedule[4], arr_schedule[5], id_class);
                    ticketService.updateStatusTicket(ticket_id);
                }else {
                    //B2.2Nếu không chuyển sang check lick tập
                    for (int i = 0; i < arr_schedule.length; i++) {
                        if(arr_schedule[i].equals("1")){
                            if( i == 0 && arr_schedule[i].equals(monday)){
                                error = "false-Huấn luyện viên này đã có lịch vào thứ 2";
                                break;
                            }
                            if( i == 1 && arr_schedule[i].equals(tuesday)){
                                error = "false-Huấn luyện viên này đã có lịch vào thứ 3";
                                break;

                            }
                            if( i == 2 && arr_schedule[i].equals(wednesday)){
                                error = "false-Huấn luyện viên này đã có lịch vào thứ 4";
                                break;
                            }
                            if( i == 3 && arr_schedule[i].equals(thursday)){
                                error = "false-Huấn luyện viên này đã có lịch vào thứ 5";
                                break;
                            }
                            if( i == 4 && arr_schedule[i].equals(friday)){
                                error = "false-Huấn luyện viên này đã có lịch vào thứ 6";
                                break;
                            }
                            if( i == 5 && arr_schedule[i].equals(saturday)){
                                error = "false-Huấn luyện viên này đã có lịch vào thứ 7";
                                System.out.println(error);
                                break;
                            }
                            if( i == 6 && arr_schedule[i].equals(sunday)){
                                error = "false-Huấn luyện viên này đã có lịch vào thứ 2";
                                System.out.println(error);
                                break;
                            }
                        }
                    }
                    if(error.equalsIgnoreCase("true-Thêm lớp thành công")){
                        classService.createNewClass(id_class, class_name, time_id, 0, date, end_date, trainer_id,
                                ticket_id, max_member,price, dataUtil.getDateNowToString());
                        classService.createClassWeekdays(arr_schedule[6], arr_schedule[0], arr_schedule[1]
                                , arr_schedule[2], arr_schedule[3],arr_schedule[4], arr_schedule[5], id_class);
                        ticketService.updateStatusTicket(ticket_id);
                    }
                }
            }
            return new ResponseEntity<String>(error,HttpStatus.OK);
        }catch (Exception e) {
            return new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
        }
    }
}
