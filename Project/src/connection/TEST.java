package connection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class TEST {

	
	
	StringBuffer sb = new StringBuffer();
	ResultSet rs = null;
	PreparedStatement pstmt = null;
	Connection conn = null;
	
	
public TEST() {
	
	conn = OracleXEConnection.getInstance().getConnection();
	
	sb.setLength(0);
	sb.append("select memberid from member ");
	
	try {
		pstmt = conn.prepareStatement(sb.toString());
		rs = pstmt.executeQuery();
		
		rs.next();
		
		String memberid = rs.getString(1);
		
		System.out.println("memberid : " + memberid);
		
		
		
	} catch (SQLException e) {
		e.printStackTrace();
	}
	


}
	
	
}
