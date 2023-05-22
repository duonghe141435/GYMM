package swp12.gym.model.entity;

public class Revenue {
    private String month;
    private int total_money;
    private String year;

    public Revenue() {
    }

    public Revenue(String month, int total_money, String year) {
        this.month = month;
        this.total_money = total_money;
        this.year = year;
    }

    public String getMonth() {
        return month;
    }

    public void setMonth(String month) {
        this.month = month;
    }

    public int getTotal_money() {
        return total_money;
    }

    public void setTotal_money(int total_money) {
        this.total_money = total_money;
    }

    public String getYear() {
        return year;
    }

    public void setYear(String year) {
        this.year = year;
    }
}
