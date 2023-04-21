package swp12.gym.dto;

public class TicketUserDto {

    private String name;
    private String create_date;
    private String start_date;
    private String end_date;

    public TicketUserDto() {
    }

    public TicketUserDto(String name, String create_date, String start_date, String end_date) {
        this.name = name;
        this.create_date = create_date;
        this.start_date = start_date;
        this.end_date = end_date;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getCreate_date() {
        return create_date;
    }

    public void setCreate_date(String create_date) {
        this.create_date = create_date;
    }

    public String getStart_date() {
        return start_date;
    }

    public void setStart_date(String start_date) {
        this.start_date = start_date;
    }

    public String getEnd_date() {
        return end_date;
    }

    public void setEnd_date(String end_date) {
        this.end_date = end_date;
    }

    @Override
    public String toString() {
        return "TicketUserDto{" +
                "name='" + name + '\'' +
                ", create_date='" + create_date + '\'' +
                ", start_date='" + start_date + '\'' +
                ", end_date='" + end_date + '\'' +
                '}';
    }
}
