package model.been;

public abstract class Person {
        private String fullName;
        private String birthDay;
        private int idNumber;
        private String phoneNumber;
        private String email;
        private String idCard;

        public Person() {
        }

        public Person(int idNumber,String fullName, String birthDay,String phoneNumber, String email,String idCard) {
                this.fullName = fullName;
                this.birthDay = birthDay;
                this.idNumber = idNumber;
                this.phoneNumber = phoneNumber;
                this.email = email;
                this.idCard = idCard;
        }
        public Person(String fullName, String birthDay,String phoneNumber, String email,String idCard) {
                this.fullName = fullName;
                this.birthDay = birthDay;
                this.phoneNumber = phoneNumber;
                this.email = email;
                this.idCard = idCard;
        }

        public String getIdCard() {
                return idCard;
        }

        public void setIdCard(String idCard) {
                this.idCard = idCard;
        }

        public String getFullName() {
                return fullName;
        }

        public void setFullName(String fullName) {
                this.fullName = fullName;
        }

        public String getBirthDay() {
                return birthDay;
        }

        public void setBirthDay(String birthDay) {
                this.birthDay = birthDay;
        }


        public int getIdNumber() {
                return idNumber;
        }

        public void setIdNumber(int idNumber) {
                this.idNumber = idNumber;
        }

        public String getPhoneNumber() {
                return phoneNumber;
        }

        public void setPhoneNumber(String phoneNumber) {
                this.phoneNumber = phoneNumber;
        }

        public String getEmail() {
                return email;
        }

        public void setEmail(String email) {
                this.email = email;
        }

}
