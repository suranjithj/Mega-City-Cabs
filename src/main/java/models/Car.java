package models;

public class Car {
    // Encapsulation
    private int id;
    private String driver_id;
    private String car_no;
    private String seat_count;
    private String fee;
    private String status;
    private String image;

    public Car(String driver_id, String car_no, String seat_count, String fee, String status, String fileName) {}

    public Car(int id, String driver_id, String car_no, String seat_count, String fee, String status, String image) {
        this.id = id;
        this.driver_id = driver_id;
        this.car_no = car_no;
        this.seat_count = seat_count;
        this.fee = fee;
        this.status = status;
        this.image = image;
    }

    //getters and setters
    // Encapsulation
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getDriver_id() {
        return driver_id;
    }

    public void setDriver_id(String driver_id) {
        this.driver_id = driver_id;
    }

    public String getCar_no() {
        return car_no;
    }

    public void setCar_no(String car_no) {
        this.car_no = car_no;
    }

    public String getSeat_count() {
        return seat_count;
    }

    public void setSeat_count(String seat_count) {
        this.seat_count = seat_count;
    }

    public String getFee() {
        return fee;
    }

    public void setFee(String fee) {
        this.fee = fee;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }
}
