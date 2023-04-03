package swp12.gym.dao;

import swp12.gym.model.entity.Unit;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;

@Repository
public class UnitDao {

    @Autowired
    private JdbcTemplate jdbcTemplate;
    private String sql;

    public void createProduct(Unit unit){
        sql = "INSERT INTO product (id,name,create_date,status) " +
                "VALUES (?,?,?,?,?)";
        jdbcTemplate.update(sql,unit.getUn_id(), unit.getUn_name(),unit.getUn_create_date(), unit.isUn_status());
    }


    public List<Unit> getListUnitDemo(){
        List<Unit> units = new ArrayList<Unit>();
        units.add(new Unit(1,"Chiếc","10/01/2000",true));
        units.add(new Unit(2,"Cái","10/01/2000",true));
        units.add(new Unit(3,"Đôi","10/01/2000",true));
        units.add(new Unit(4,"Viên","10/01/2000",true));
        units.add(new Unit(5,"Cân","10/01/2000",true));
        return units;
    }




}
