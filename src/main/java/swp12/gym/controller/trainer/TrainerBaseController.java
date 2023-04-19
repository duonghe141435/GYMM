package swp12.gym.controller.trainer;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/trainer")
public class TrainerBaseController {
    @RequestMapping(value = "/index",method = RequestMethod.GET)
    public String indexEmployee(Model model) {
        return "trainer/index_trainer";
    }
}
