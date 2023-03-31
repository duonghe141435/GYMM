package swp12.gym.service;

import org.springframework.stereotype.Service;

@Service
public interface RoleService {
    public void saveRoleForUser(int id_u, int r_id);
}
