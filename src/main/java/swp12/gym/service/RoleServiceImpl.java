package swp12.gym.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import swp12.gym.dao.RoleDao;
import swp12.gym.model.entity.Role;

import java.util.List;

@Service
public class RoleServiceImpl implements RoleService {

    @Autowired
    private RoleDao roleDao;

    public List<Role> findAll() {
        return null;
    }

    public void saveRoleForUser(int id_u, int r_id) {

    }

    public void updateRoleForUser(int id_u, int id_r) {

    }
}
