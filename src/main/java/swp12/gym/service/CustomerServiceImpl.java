package swp12.gym.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import swp12.gym.dao.UsersDao;
import swp12.gym.model.entity.User;

@Service
public class CustomerServiceImpl implements CustomerService {

    @Autowired
    private UsersDao usersDao;

    public void createCustomer(User user) {
        usersDao.createCustomer(user);
    }
}
