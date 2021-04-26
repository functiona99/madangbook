package user;

public class Users {
	private int grade;
	private String userID;
	private String userPassword;
	private String userName;
	private String userPhoneNo;
	private String userEmail;
	private String userAddr;
	private String regdate;
	
	public Users() {}
	
	

	public Users(int grade, String userID, String userPassword, String userName, String userPhoneNo, String userEmail,
			String userAddr, String regdate) {
		super();
		this.grade = grade;
		this.userID = userID;
		this.userPassword = userPassword;
		this.userName = userName;
		this.userPhoneNo = userPhoneNo;
		this.userEmail = userEmail;
		this.userAddr = userAddr;
		this.regdate = regdate;
	}



	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	public String getUserPassword() {
		return userPassword;
	}
	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}

	public int getGrade() {
		return grade;
	}

	public void setGrade(int grade) {
		this.grade = grade;
	}

	public String getUserPhoneNo() {
		return userPhoneNo;
	}

	public void setUserPhoneNo(String userPhoneNo) {
		this.userPhoneNo = userPhoneNo;
	}

	public String getUserAddr() {
		return userAddr;
	}

	public void setUserAddr(String userAddr) {
		this.userAddr = userAddr;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	
	

}
