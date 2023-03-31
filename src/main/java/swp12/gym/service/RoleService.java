package swp12.gym.service;

import org.springframework.stereotype.Service;
import swp12.gym.model.entity.Role;

import java.util.List;

@Service
public interface RoleService {
    List<Role> findAllForAdmin();
}
