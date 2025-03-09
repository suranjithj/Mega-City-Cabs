package models;

public class Driver {
    // Encapsulation
    private int id;
    private String name;
    private String phone;
    private String nic;
    private String status;

    public Driver() {}

    public Driver(int id, String name, String phone, String nic, String status) {
        this.id = id;
        this.name = name;
        this.phone = phone;
        this.nic = nic;
        this.status = status;
    }

    //getters and setters
    // Encapsulation
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getNic() {
        return nic;
    }

    public void setNic(String nic) {
        this.nic = nic;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}
