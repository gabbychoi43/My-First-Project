package dao;

import java.security.spec.RSAKeyGenParameterSpec;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;

import vo.AccountVO;
import vo.MemberVO;
import connection.OracleXEConnection;

public class MemberDAO {
   

   StringBuffer sb = new StringBuffer();
   ResultSet rs = null;
   PreparedStatement pstmt = null;
   Connection conn = null;
   
   
   public MemberDAO() {
      
    /*   
     * 싱글톤 패턴으로 접속할 것이므로 connection 방식이 바뀌어야함
     * 
    */      
      conn = OracleXEConnection.getInstance().getConnection();
      
      /*try {
         conn.setAutoCommit(false);
      } catch (SQLException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      }
      */
      
   } // 생성자 end
   
   // 1. 회원가입
   
   public void addData(MemberVO vo) {
      
      sb.setLength(0);
      sb.append("insert into member ");
      sb.append("values (?, ?, ?, ?, ?, sysdate ) ");
      
      
      try {
         pstmt = conn.prepareStatement(sb.toString());
         
         pstmt.setString(1, vo.getMemberid());
         pstmt.setString(2, vo.getMemberpw());
         pstmt.setString(3, vo.getMembername());
         pstmt.setString(4, vo.getMemberbirth());
         pstmt.setString(5, vo.getmemberphoneno());
      
         
         pstmt.executeUpdate();
      /*   if(pstmt.executeUpdate()==1) {
                  conn.commit();
               }else {
                  conn.rollback();
               }*/
      } catch (SQLException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      }
      
      
   } // addData() end
   
   // 2. 회원정보 수정
   
   public void updateAll(MemberVO vo) {
      sb.setLength(0);
      sb.append("update member ");
      sb.append("set memberid = ?, memberpw = ?, membername = ?, memberbirth = ?, memberphoneno = ? ");
      sb.append("where memberid = ? ");
      
      try {
         pstmt=conn.prepareStatement(sb.toString());
         
         pstmt.setString(1, vo.getMemberid());
         pstmt.setString(2, vo.getMemberpw());
         pstmt.setString(3, vo.getMembername());
         pstmt.setString(4, vo.getMemberbirth());
         pstmt.setString(5, vo.getmemberphoneno());
         pstmt.setString(6, vo.getMemberid());
         
         pstmt.executeUpdate();
      /*   
         if(pstmt.executeUpdate()==1) {
                  conn.commit();
               }else {
                  conn.rollback();
               }*/
         
      } catch (SQLException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      }
      
      
      
   }// updateAll() 끝
   
   
   // 3. ID 찾기
   public MemberVO findId(String membername, String memberbirth) {
      
      sb.setLength(0);
      sb.append("select memberid from member ");
      sb.append("where membername = ? and memberbirth = ? ");
      
      String id = null;
      
      MemberVO vo = null;
      
      try {
         pstmt = conn.prepareStatement(sb.toString());
         pstmt.setString(1, membername);
         pstmt.setString(2, memberbirth);
         
         rs= pstmt.executeQuery();
         
         boolean f=rs.next();
         if(f==true) {
         id = rs.getString(1);
         }
         vo = new MemberVO(id, membername, memberbirth);
         
      } catch (SQLException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      }
      
      return vo;
   } // findId() end
   
   // 4 . PW 찾기
   
   public MemberVO findPw(String memberid, String memberbirth) {
      
      sb.setLength(0);
      sb.append("select memberpw from member ");
      sb.append("where memberid = ? and memberbirth = ? ");
      
      String pw = null;
      
      MemberVO vo = null;
      String membername = null;
      try {
         
         pstmt = conn.prepareStatement(sb.toString());
         pstmt.setString(1, memberid);
         pstmt.setString(2, memberbirth);
         
         rs= pstmt.executeQuery();
         boolean f=rs.next();
         if(f==true) {
         pw = rs.getString(1);
         }
         
         
         vo = new MemberVO(pw, memberid, memberbirth, membername);
         
      } catch (SQLException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      }
      
      return vo;
   } //findPw() end 
   
   
   // 5. 회원 탈퇴
   
// 5. 회원 탈퇴
   
   public void DeleteOne(String memberid, String memberpw) {
      
      sb.setLength(0);
      sb.append("delete from member ");
      sb.append("where memberid = ? and memberpw = ? ");
      
      try {
         pstmt = conn.prepareStatement(sb.toString());
         pstmt.setString(1, memberid);
         pstmt.setString(2, memberpw);
         
         
         if(pstmt.executeUpdate()==1) {
                  conn.commit();
               }else {
                  conn.rollback();
               }
         
      } catch (SQLException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      }
      
      
   } // DeleteOne() end
   
   // 6. ID 중복 확인
   
   public boolean isExist(String memberid) {
      
      sb.setLength(0);
      sb.append("select * from member "); 
      sb.append("where memberid = ? ");
      
      boolean isOk = false; // true를 초기화 시키면 안됨
      
      
      try {
         pstmt = conn.prepareStatement(sb.toString());
         pstmt.setString(1, memberid);
         
         rs= pstmt.executeQuery();
         isOk=rs.next();
      } catch (SQLException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      }
      
      return isOk;
   }// isExist
   
// 7. id,pw로 로그인 
   public boolean loginCheck(String memberid, String memberpw) {
      
      boolean result = false;
      sb.setLength(0);
      sb.append("select * from member ");
      sb.append("where memberid = ? and memberpw = ? ");
   
      
      try {
         pstmt = conn.prepareStatement(sb.toString());
         pstmt.setString(1, memberid);
         pstmt.setString(2, memberpw);
         rs = pstmt.executeQuery();
         
         if( rs.next()) {
            result=true;
         }
         
         //rs.next();
         
      } catch (SQLException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      }
      
      return result;
      
   }
   
   public MemberVO MemberInfoById(String memberid){
		
		MemberVO vo=new MemberVO();
		sb.setLength(0);
		sb.append("select * from MEMBER ");
		sb.append("where MEMBERID = ? ");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());

			pstmt.setString(1, memberid);
			
			rs = pstmt.executeQuery();
					
			while(rs.next()) {
				String memberpw = rs.getString(2);
				String membername = rs.getString(3);
				String memberbirth = rs.getString(4);
				String memberphoneno = rs.getString(5);
				
				vo = new MemberVO(memberid, memberpw, membername, memberbirth, memberphoneno);
			
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return vo;
	}// AccountInfoById end
   
   
// 7. 전체 조회
   public ArrayList selectAll(String memberid) {
   
   ArrayList<MemberVO> list = new ArrayList<MemberVO>();
   
   sb.setLength(0);
   sb.append("select * from member ");
   sb.append("where memberid = ? ");
   
   try {
      pstmt =conn.prepareStatement(sb.toString());
      pstmt.setString(1, memberid);
      rs = pstmt.executeQuery();
      
      while(rs.next()) {
         
      
      
         String memberpw = rs.getString(2);
         String membername = rs.getString(3);
         String memberbirth = rs.getString(4);
         String memberphoneno = rs.getString(5);
         
         
         MemberVO vo = new MemberVO();

         vo.setMemberid(memberid);
         vo.setMemberpw(memberpw);
         vo.setMembername(membername);
         vo.setMemberbirth(memberbirth);
         vo.setmemberphoneno(memberphoneno);
      
         list.add(vo);
      }
      
      
   } catch (SQLException e) {
      // TODO Auto-generated catch block
      e.printStackTrace();
   }
   
   
   
   
   return list;
   
   
}

   
   
   
   //자원반납
   
   public void close() {
      
      if(rs != null)
         try {
            rs.close();
            if(pstmt != null) pstmt.close();
            if(pstmt != null) conn.close();
         } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
         }
   
   
   
   } // close () end
   
}