package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import connection.OracleXEConnection;
import vo.AccountVO;

public class AccountDAO {

	StringBuffer sb = new StringBuffer();
	ResultSet rs = null;
	PreparedStatement pstmt = null;
	Connection conn = null;

	public AccountDAO() {
		conn = OracleXEConnection.getInstance().getConnection();
		try {
			conn.setAutoCommit(false);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	//계좌 추가 메소드
	public void addAccount(AccountVO vo) {
		sb.setLength(0);
		sb.append("insert into ACCOUNT ");
		sb.append("values (?, ?, ?, ?, ? ) ");
		
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setString(1, vo.getAccount());
			pstmt.setString(2, vo.getMemberid());
			pstmt.setString(3, vo.getMembername());
			pstmt.setInt(4, vo.getBalance());
			pstmt.setString(5, vo.getAccountpw());
			
			if(pstmt.executeUpdate()==1) {
	         	conn.commit();
	         }else {
	         	conn.rollback();
	         }
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}// addAccount end 
	
	
	//계좌번호를 통한 계좌 조회
	public	AccountVO AccountInfoByAccount(String account){
		sb.setLength(0);
		sb.append("select * from Account ");
		sb.append("where ACCOUNT = ? ");
		
		AccountVO vo = null;
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setString(1, account);
			rs = pstmt.executeQuery();
			
			rs.next();
			
			String memberid = rs.getString(2);
			String membername = rs.getString(3);
			int balance = rs.getInt(4);
			String accountpw = rs.getString(5);
			
			vo = new AccountVO(memberid, membername, account, balance, accountpw);
			
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return vo;
		
		
	}//accountInfoByAccount end 
	
	public ArrayList<AccountVO> AccountInfoById(String memberid){
		
		ArrayList<AccountVO> list = new ArrayList<>();
		
		sb.setLength(0);
		sb.append("select * from ACCOUNT ");
		sb.append("where MEMBERID = ? ");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());

			pstmt.setString(1, memberid);
			
			rs = pstmt.executeQuery();
					
			while(rs.next()) {
				String account = rs.getString(1);
				String membername = rs.getString(3);
				int balance = rs.getInt(4);
				String accountpw = rs.getString(5);
				
				AccountVO vo = new AccountVO(memberid, membername, account, balance, accountpw);
				list.add(vo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}// AccountInfoById end
	
	
	//계좌번호와 비밀번호를 통한 계좌 삭제 메소드
	
	public void deleteAccount(String account, String accountpw) {
		sb.setLength(0);
		sb.append("delete from ACCOUNT ");
		sb.append("where ACCOUNT = ? and ACCOUNTPW = ? ");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setString(1, account);
			pstmt.setString(2, accountpw);
			if(pstmt.executeUpdate()==1) {
	         	conn.commit();
	         }else {
	         	conn.rollback();
	         }
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}//deleteAccount end 
	
	// id로 계좌 존재 여부 확인
	   public boolean accountCheck(String memberid) {
	      
	      boolean result = false;
	      sb.setLength(0);
	      sb.append("select * from account ");
	      sb.append("where memberid = ? ");
	   
	      
	      try {
	         pstmt = conn.prepareStatement(sb.toString());
	         pstmt.setString(1, memberid);
	         rs = pstmt.executeQuery();
	         
	         if( rs.next()) {
	            result=true;
	         }
	         
	      } catch (SQLException e) {
	         // TODO Auto-generated catch block
	         e.printStackTrace();
	      }
	      
	      return result;
	      
	   }
	
	
	
	
	
	
	




}// class end 
