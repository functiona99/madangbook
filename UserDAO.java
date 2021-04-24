package user;
//로그인 기능 구현
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserDAO {
	private Connection conn; //데이터베이스를 접근해주는 객체
	private PreparedStatement pstmt;
	private ResultSet rs;//어떠한 정보를 담을 수 있는 객체
	
	public UserDAO() {
		try { //db 접속할 수 있게 해줌
			String dbURL = "jdbc:oracle:thin:@localhost:1521:xe";
			String dbID = "scott";
			String dbPassword = "tiger";
			Class.forName("oracle.jdbc.driver.OracleDriver"); //sql에 접속할 수 있도록 매개체 역할을 해주는 라이브러리
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
			
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
		
		}
		
	}
	public int login(String userID, String userPassword) { //실제로 로그인을 시도하는 생성자
		String sql = "SELECT USERPASSWORD FROM USERS WHERE USERID= ?"; 
		try {
			pstmt = conn.prepareStatement(sql);//정해진 sql을 데이터베이스에 삽입하겠다
			pstmt.setString(1, userID); //?에 들어가고 실제로 있는 아이디인지 판별 후 비밀번호는 뭔지 데이터베이스에서 가져오게끔
			rs= pstmt.executeQuery(); //결과를 담을 수 있는 객체에 실행한 결과를 넣어줌, 아이디가 존재하지 않는다면 결과값이 나오지 않음
			if(rs.next()) {//db에서 아이디가 존재하면 이쪽
				if(rs.getString(1).equals(userPassword)) { //패스워드가 같은지
					return 1;//비밀번호도 맞으면 1을 반환함으로써 + 함수를 강제로 종료함으로써 '로그인 성공'을 반환
				}else {
					return 0; //비밀번호가 틀리면 0을 반환함으로써 비밀번호가 틀렸음을 반환
				}
			}return -1; //아이디가 존재하지 않는다면 결과값이 없어서 -1을 반환 		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return -2; //데이터베이스 오류
	}
	public int join(Users users) {
		String sql = "INSERT INTO USERS VALUES(?, ?, ?, ?, ?, ?, sysdate)";
				
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, users.getUserID());
			pstmt.setString(2, users.getUserPassword());
			pstmt.setString(3, users.getUserName());
			pstmt.setString(4, users.getUserPhoneNo());
			pstmt.setString(5, users.getUserEmail());
			pstmt.setString(6, users.getUserAddr());
			return pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}return -1; //데이터베이스 오류
	}
}
