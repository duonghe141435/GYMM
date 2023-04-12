package swp12.gym.model.entity;

public class UserClass {
    private int user_id;
    private int class_id;
    private int position;

    public UserClass() {
    }

    public UserClass(int user_id, int class_id, int position) {
        this.user_id = user_id;
        this.class_id = class_id;
        this.position = position;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public int getClass_id() {
        return class_id;
    }

    public void setClass_id(int class_id) {
        this.class_id = class_id;
    }

    public int getPosition() {
        return position;
    }

    public void setPosition(int position) {
        this.position = position;
    }

    @Override
    public String toString() {
        return "UserClass{" +
                "user_id=" + user_id +
                ", class_id=" + class_id +
                ", position='" + position + '\'' +
                '}';
    }
}
