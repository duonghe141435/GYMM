package swp12.gym.service;

import org.springframework.stereotype.Service;
import swp12.gym.model.entity.Token;

@Service
public interface TokenService {

    int createNewToken(String token, int create_time, int id_u);

    int deleteAnToken(String token, int id_u);

    Token ckeckingToken(String token_old, String time);

    void updateToken(String token_old, String time, int confirm_date);
}
