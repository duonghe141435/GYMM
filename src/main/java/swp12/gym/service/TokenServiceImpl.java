package swp12.gym.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import swp12.gym.dao.TokenDao;
import swp12.gym.model.entity.Token;

@Service
public class TokenServiceImpl implements TokenService{

    @Autowired
    private TokenDao tokenDao;

    public int createNewToken(String token, int create_time, int id_u) {
        return tokenDao.createNewToken(token,create_time,id_u);
    }

    public int deleteAnToken(String token, int id_u) {
        return tokenDao.deleteAnToken(token,id_u);
    }

    public Token ckeckingToken(String token_old, String time) {
        return tokenDao.ckeckingToken(token_old,time);
    }

    public void updateToken(String token_old, String time, int confirm_date) {
        tokenDao.updateToken(token_old,time, confirm_date);
    }
}
