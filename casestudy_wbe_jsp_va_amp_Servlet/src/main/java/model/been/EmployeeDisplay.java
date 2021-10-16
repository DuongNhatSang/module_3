package model.been;

public class EmployeeDisplay extends Person{
    private String position;
    private double salary;
    private String address;
    private String educationDegree;
    private String division;


    public EmployeeDisplay() {
    }


    public EmployeeDisplay(int idNumber, String fullName, String birthDay, String idCard, double salary,
                           String phoneNumber, String email, String address, String position, String educationDegree, String division) {
        super(idNumber, fullName, birthDay,  phoneNumber, email,idCard);
        this.position = position;
        this.salary = salary;
        this.address = address;
        this.educationDegree = educationDegree;
        this.division = division;
    }


    public String getEducationDegree() {
        return educationDegree;
    }

    public void setEducationDegree(String educationDegree) {
        this.educationDegree = educationDegree;
    }

    public String getDivision() {
        return division;
    }

    public void setDivision(String division) {
        this.division = division;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }
    public String getPosition() {
        return position;
    }

    public void setPosition(String position) {
        this.position = position;
    }

    public double getSalary() {
        return salary;
    }

    public void setSalary(double salary) {
        this.salary = salary;
    }


}
