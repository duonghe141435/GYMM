package swp12.gym.controller.customer.base;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import swp12.gym.common.PaymentConfig;
import swp12.gym.dao.UsersDao;
import swp12.gym.model.entity.TicketUser;
import swp12.gym.model.entity.UserClass;
import swp12.gym.service.TicketService;
import swp12.gym.service.TicketUserService;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.text.SimpleDateFormat;
import java.util.*;


@CrossOrigin
@Controller
@RequestMapping("/homepage")
public class OnlineHomeController {

    @Autowired
    private UsersDao userDao;
    @Autowired
    private TicketService ticketService;
    @Autowired
    private TicketUserService ticketUserService;

    //test


    //test
    @GetMapping("/list_bookPt")
    public String checkoutlistbookPt(Authentication authentication, Model model){
//        if(authentication != null){
//            AccountDetailImpl accountDetail = (AccountDetailImpl) authentication.getPrincipal();
//            model.addAttribute("auth", accountDetail);
//        }else{
//            model.addAttribute("auth", null);
//        }
        return "customer/list_bookPt";
    }

    @GetMapping("/create-payment")
    public ResponseEntity<String> createPayment(@RequestParam(value = "amount") int amount, Authentication authentication) throws UnsupportedEncodingException {
        amount = amount * 100;
        String orderid = PaymentConfig.getRandomNumber(3);

//        Map vnp_Params = new HashMap<>();
        Map<String, String> vnp_Params = new HashMap();
        vnp_Params.put("vnp_Version", PaymentConfig.VERSION);
        vnp_Params.put("vnp_Command", PaymentConfig.COMMAND);
        vnp_Params.put("vnp_TmnCode", PaymentConfig.vnp_TmnCode);
        vnp_Params.put("vnp_Amount", String.valueOf(amount));
        vnp_Params.put("vnp_CurrCode", "VND");
        vnp_Params.put("vnp_TxnRef", orderid);
        vnp_Params.put("vnp_OrderInfo", "GYMM - Thanh toan hoa don");
        vnp_Params.put("vnp_OrderType", PaymentConfig.ORDER_TYPE);
        vnp_Params.put("vnp_Locale", "vn");
        vnp_Params.put("vnp_BankCode", "VNBANK");
        vnp_Params.put("vnp_ReturnUrl", PaymentConfig.vnp_Returnurl); // nếu thành công thì sẽ sang controller
        vnp_Params.put("vnp_IpAddr", "127.0.0.1");
        Calendar cld = Calendar.getInstance(TimeZone.getTimeZone("Etc/GMT+7"));

        SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
        String vnp_CreateDate = formatter.format(cld.getTime());

        vnp_Params.put("vnp_CreateDate", vnp_CreateDate);

        //Build data to hash and querystring
        List fieldNames = new ArrayList(vnp_Params.keySet());
        Collections.sort(fieldNames);
        StringBuilder hashData = new StringBuilder();
        StringBuilder query = new StringBuilder();
        Iterator itr = fieldNames.iterator();
        while (itr.hasNext()) {
            String fieldName = (String) itr.next();
            String fieldValue = (String) vnp_Params.get(fieldName);
            if ((fieldValue != null) && (fieldValue.length() > 0)) {
                //Build hash data
                hashData.append(fieldName);
                hashData.append('=');
                hashData.append(URLEncoder.encode(fieldValue, StandardCharsets.US_ASCII.toString()));
                //Build query
                query.append(URLEncoder.encode(fieldName, StandardCharsets.US_ASCII.toString()));
                query.append('=');
                query.append(URLEncoder.encode(fieldValue, StandardCharsets.US_ASCII.toString()));
                if (itr.hasNext()) {
                    query.append('&');
                    hashData.append('&');
                }
            }
        }
        String queryUrl = query.toString();
        String vnp_SecureHash = PaymentConfig.hmacSHA512(PaymentConfig.vnp_HashSecret, hashData.toString());
        queryUrl += "&vnp_SecureHash=" + vnp_SecureHash;
        String paymentUrl = PaymentConfig.vnp_PayUrl + "?" + queryUrl;
        System.out.println("URL: " + paymentUrl);

        return ResponseEntity.status(HttpStatus.OK).body(paymentUrl);
    }

    @RequestMapping(value = "/payment-result",method = RequestMethod.GET)
    public String paymentResult(Authentication authentication){
        UserDetails userDetails = (UserDetails) authentication.getPrincipal();
        String userName = userDetails.getUsername();
        int userID = userDao.findIdByUsername(userName);

        ticketUserService.updateTicketUser(userID);
        ticketUserService.updateUserClass(userID);
        ticketUserService.updateUserPersonal(userID);

        return "redirect:/customer/home";
    }

}
