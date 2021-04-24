package bbs;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class BbsDAO {//데이터 접근 객체의 약자 실제로 데이터 베이스에 접근을 해서 어떤 데이터를 빼올 수 있게끔

	private Connection conn; //데이터베이스를 접근해주는 객체
	private ResultSet rs;//어떠한 정보를 담을 수 있는 객체
	
	
	public BbsDAO() {
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
	public String getDate() {//현재 시간을 가져오는 함수로써 게시판에 글을 작성할 때 현재 쓰는 시간을 넣어주는 거임
		//pstmt를 쓰면 함수가 충돌할 수 있기 때문에 메인이 아닌 여기에 넣어놈
		String sql = "select sysdate from bbs";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				return rs.getString(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "";  //데이터베이스 오류
		
	}

	
	public int getNext() {
		String sql = "select bbsID from bbs order by bbsid desc";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				return rs.getInt(1) +1; //게시글 번호는 1번부터 늘어나야하기 때문에 마지막으로 쓴 번호에 1을 더해야 다음 번호가 ㄴ옴
			}
			return 1; //쓰여진 게시물이 없으면 값이 나오지 않으니까
			//현재가 첫 번째 게시글인 경우 return 1을 함으로써 위치를 알려줌
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return -1;  //게시글 번호로써 적절하지 않다고 프로그램 오류가 났다고 말해줌
		
	}
	
	  public int write(String bbsTitle, String userID, String bbsContent) {
	        String SQL = "INSERT INTO BBS VALUES (?,?,?,?,?,?)";
	        try {
	            PreparedStatement pstmt = conn.prepareStatement(SQL);
	            pstmt.setInt(1, getNext());
	            pstmt.setString(2, bbsTitle);
	            pstmt.setString(3, userID);
	            pstmt.setString(4, getDate());
	            pstmt.setString(5, bbsContent);
	            pstmt.setInt(6, 1);
	            return pstmt.executeUpdate();//성공적으로 수행을 했다면 0 이상의 결과를 반환함
			
			//쓰여진 게시물이 없으면 값이 나오지 않으니까
			//현재가 첫 번째 게시글인 경우 return 1을 함으로써 위치를 알려줌
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return -1;  //데이터베이스 오류

	}
}
