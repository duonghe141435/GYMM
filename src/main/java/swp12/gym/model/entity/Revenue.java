package swp12.gym.model.entity;

public class Revenue {
    private String time;
    private int total_money;

    public Revenue() {
    }

    public Revenue(String time, int total_money) {
        this.time = time;
        this.total_money = total_money;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public int getTotal_money() {
        return total_money;
    }

    public void setTotal_money(int total_money) {
        this.total_money = total_money;
    }

}
