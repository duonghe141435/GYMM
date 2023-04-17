package swp12.gym.service;

import swp12.gym.dao.LogUserDao;
import swp12.gym.dto.LogUserDto;
import swp12.gym.model.entity.LogUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class LogUserServiceImpl implements LogUserService{

    @Autowired
    private LogUserDao logUserDao;

    public List<LogUserDto> getAllLogOfUser() {
        return logUserDao.getAllLogOfUser();
    }

    public List<LogUser> getAnLogOfAnUser(int u_id) {
        return logUserDao.getLogOfAnUser(u_id);
    }

    public void saveLog(int u_id, int type, int time, String content) {
        logUserDao.saveLogUser(u_id, type, time, content);
    }
}
