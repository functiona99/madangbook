package book;

public class Customer {

	private String custID;
	private String custPwd;
	private String custName;
	private String phoneNo;
	private String addr;
	private String email;
	private String regDate;

	public Customer() {}

	public Customer(String custID, String custPwd, String custName, String phoneNo, String addr, String email, String regDate) {
		super();
		this.custID = custID;
		this.custPwd = custPwd;
		this.custName = custName;
		this.phoneNo = phoneNo;
		this.addr = addr;
		this.email = email;
		this.regDate = regDate;
	}

	public String getCustID() {
		return custID;
	}

	public void setCustID(String custID) {
		this.custID = custID;
	}

	public String getCustPwd() {
		return custPwd;
	}

	public void setCustPwd(String custPwd) {
		this.custPwd = custPwd;
	}

	public String getCustName() {
		return custName;
	}

	public void setCustName(String custName) {
		this.custName = custName;
	}

	public String getPhoneNo() {
		return phoneNo;
	}

	public void setPhoneNo(String phoneNo) {
		this.phoneNo = phoneNo;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getRegDate() {
		return regDate;
	}

	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}


}

	
