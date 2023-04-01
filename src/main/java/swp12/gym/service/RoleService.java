package swp12.gym.service;

import org.springframework.stereotype.Service;
import swp12.gym.model.entity.Role;

import java.util.List;

@Service
public interface RoleService {
    //Get All Role In System
    List<Role> findAll();
    //Save role of User
    void saveRoleForUser(int id_u, int r_id);
    //Update role of User
    void updateRoleForUser(int u_id, int r_id);
}
