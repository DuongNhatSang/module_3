package model.been;

public class Contract {
    private String contractsCode;
    private String bookingCode;
    private double deposit;
    private double totalMoney;
    private String customerCode;

    public Contract() {
    }

    public Contract(String contractsCode, String bookingCode, double deposit, double totalMoney, String customerCode) {
        this.contractsCode = contractsCode;
        this.bookingCode = bookingCode;
        this.deposit = deposit;
        this.totalMoney = totalMoney;
        this.customerCode = customerCode;
    }

    public String getContractsCode() {
        return contractsCode;
    }

    public void setContractsCode(String contractsCode) {
        this.contractsCode = contractsCode;
    }

    public String getBookingCode() {
        return bookingCode;
    }

    public void setBookingCode(String bookingCode) {
        this.bookingCode = bookingCode;
    }

    public double getDeposit() {
        return deposit;
    }

    public void setDeposit(double deposit) {
        this.deposit = deposit;
    }

    public double getTotalMoney() {
        return totalMoney;
    }

    public void setTotalMoney(double totalMoney) {
        this.totalMoney = totalMoney;
    }

    public String getCustomerCode() {
        return customerCode;
    }

    public void setCustomerCode(String customerCode) {
        this.customerCode = customerCode;
    }

    @Override
    public String toString() {
        return "Booking{" +
                "contractsCode='" + contractsCode + '\'' +
                ", bookingCode='" + bookingCode + '\'' +
                ", deposit=" + deposit +
                ", totalMoney=" + totalMoney +
                ", customerCode='" + customerCode + '\'' +
                '}';
    }
    public String getToString(){
        return this.getContractsCode() + "," + this.getBookingCode() + "," + this.getDeposit() + "," + this.getTotalMoney() + "," + this.getCustomerCode();
    }
}
