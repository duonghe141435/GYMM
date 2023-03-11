package swp12.gym.model.mapper;

import swp12.gym.model.entity.Unit;
import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

public class UnitMapper implements RowMapper<Unit> {
    public Unit mapRow(ResultSet resultSet, int i) throws SQLException {
        Unit unit = new Unit();

        unit.setUn_id(resultSet.getInt("unit_id"));
        unit.setUn_name(resultSet.getString("name"));
        unit.setUn_create_date(resultSet.getDate("create_date"));
        unit.setUn_status(resultSet.getBoolean("status"));
        return unit;
    }
}
