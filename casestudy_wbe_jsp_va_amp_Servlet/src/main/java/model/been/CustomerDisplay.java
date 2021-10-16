package model.been;

public class CustomerDisplay extends Person {
        private String customerType;
        private String address;
        private Boolean gender;

        public CustomerDisplay() {
        }

        public CustomerDisplay(int idNumber, String customerType, String fullName, String birthDay, Boolean gender,
                              String idCard, String phoneNumber, String email, String address) {
                super(idNumber, fullName, birthDay,  phoneNumber, email,idCard);
                this.customerType = customerType;
                this.address = address;
                this.gender = gender;
        }

        public Boolean getGender() {
                return gender;
        }

        public void setGender(Boolean gender) {
                this.gender = gender;
        }

        public String getCustomerType() {
                return customerType;
        }

        public void setCustomerType(String customerType) {
                this.customerType = customerType;
        }

        public String getAddress() {
                return address;
        }

        public void setAddress(String address) {
                this.address = address;
        }


}
