package model.been;

public class Customer extends Person{
    private int customerTypeId;
    private String address;
    private Boolean gender;

    public Customer() {
    }

    public Customer(int customerTypeId, String fullName, String birthDay, Boolean gender,
                           String idCard, String phoneNumber, String email, String address) {
        super(fullName, birthDay,  phoneNumber, email,idCard);
        this.customerTypeId = customerTypeId;
        this.address = address;
        this.gender = gender;
    }

    public Boolean getGender() {
        return gender;
    }

    public void setGender(Boolean gender) {
        this.gender = gender;
    }

    public int getCustomerTypeId() {
        return customerTypeId;
    }

    public void setCustomerTypeId(int customerType) {
        this.customerTypeId = customerType;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }
}
