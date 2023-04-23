package swp12.gym.controller.employee.api;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import swp12.gym.model.entity.Order;
import swp12.gym.model.entity.OrderDetail;
import swp12.gym.service.OrderDetailService;
import swp12.gym.service.OrderService;
import swp12.gym.service.ProductService;

import javax.servlet.http.HttpServletRequest;

import java.util.ArrayList;
import java.util.List;

import static java.lang.Integer.parseInt;

@RestController
public class OrderApi {

    private final String URL_API = "/employeeApi";

    @Autowired
    private OrderService orderService;

    @Autowired
    private OrderDetailService orderDetailService;

    @Autowired
    private ProductService productService;

    @RequestMapping(value = URL_API + "/save_order", method = RequestMethod.POST)
    public ResponseEntity<String> goSaveOrder(HttpServletRequest request){
        try{
            Gson gson = new Gson();
            String _order = request.getParameter("_order");
            JsonElement jsonElement = gson.fromJson(_order, JsonElement.class);
            Order order = new Order();
            JsonObject jsonObject = jsonElement.getAsJsonObject();
            order.setCode(jsonObject.get("_code").getAsString());
            order.setStaff_id(jsonObject.get("_staff").getAsInt());
            order.setCustomer_id(jsonObject.get("_customer").getAsInt());
            order.setTotal_amount(jsonObject.get("_total_amount").getAsFloat());
            order.setDiscount(jsonObject.get("_discount").getAsInt());

            order.setTotal_payment(jsonObject.get("_total_payment").getAsFloat());
            order.setCustomer_paying(jsonObject.get("_customer_paying").getAsFloat());
            order.setChange(jsonObject.get("_change").getAsFloat());
            orderService.goSaveOrder(order);
            int order_id = orderService.getIdOrder();
            return ResponseEntity.status(HttpStatus.OK).body("" + order_id);

        }catch (Exception e){
            return new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
        }
    }

    @RequestMapping(value = URL_API + "/save_order_detail", method = RequestMethod.POST)
    public ResponseEntity<String> goSaveOrderDetail(HttpServletRequest request){
        try{
            Gson gson = new Gson();
            String listProduct = request.getParameter("listProduct");
            System.out.println(listProduct);
//            JsonElement jsonElement = gson.fromJson(list, JsonElement.class);
            JsonElement jsonElement = gson.fromJson(listProduct, JsonElement.class);
            List<OrderDetail> orderDetails = new ArrayList<OrderDetail>();
            if (jsonElement.isJsonArray()) {
                JsonArray jsonArray = jsonElement.getAsJsonArray();
                for (JsonElement elem : jsonArray) {
                    JsonObject jsonObject = elem.getAsJsonObject();
//                    String attendance_date = jsonObject.get("_attendance_date").getAsString();
                    int product_id = jsonObject.get("_product_id").getAsInt();
                    int quantity = jsonObject.get("_quantity").getAsInt();
                    int price_original = jsonObject.get("_price_original").getAsInt();
                    int price_sale = jsonObject.get("_price_sale").getAsInt();
                    int total_price = jsonObject.get("_totalprice").getAsInt();
                    int order_id = jsonObject.get("_order_id").getAsInt();

                    orderDetails.add(new OrderDetail(quantity, price_sale, price_original, order_id, product_id, total_price));
                }
            }

            orderDetailService.goSaveOrderDetail(orderDetails);
            productService.updateQuantityProduct(orderDetails);
            return new ResponseEntity<String>(HttpStatus.OK);
        }catch (Exception e){
            return new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
        }
    }

}
