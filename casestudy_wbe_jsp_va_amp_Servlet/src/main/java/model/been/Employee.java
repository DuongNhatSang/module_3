package model.been;

public class Employee extends Person{
    private int positionId;
    private double salary;
    private String address;
    private int educationDegreeId;
    private int divisionId;


    public Employee() {
    }


    public Employee(String fullName, String birthDay, String idCard, double salary,
                           String phoneNumber, String email, String address, int positionId, int educationDegreeId, int divisionId) {
        super(fullName, birthDay,  phoneNumber, email,idCard);
        this.positionId = positionId;
        this.salary = salary;
        this.address = address;
        this.educationDegreeId = educationDegreeId;
        this.divisionId = divisionId;
    }
    public Employee(int idNumber,String fullName, String birthDay, String idCard, double salary,
                    String phoneNumber, String email, String address, int positionId, int educationDegreeId, int divisionId) {
        super(idNumber ,fullName, birthDay,  phoneNumber, email,idCard);
        this.positionId = positionId;
        this.salary = salary;
        this.address = address;
        this.educationDegreeId = educationDegreeId;
        this.divisionId = divisionId;
    }

    public int getPositionId() {
        return positionId;
    }

    public void setPositionId(int positionId) {
        this.positionId = positionId;
    }

    public double getSalary() {
        return salary;
    }

    public void setSalary(double salary) {
        this.salary = salary;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public int getEducationDegreeId() {
        return educationDegreeId;
    }

    public void setEducationDegreeId(int educationDegreeId) {
        this.educationDegreeId = educationDegreeId;
    }

    public int getDivisionId() {
        return divisionId;
    }

    public void setDivisionId(int divisionId) {
        this.divisionId = divisionId;
    }
}
