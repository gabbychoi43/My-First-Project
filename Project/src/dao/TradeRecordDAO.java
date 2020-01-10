package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import connection.OracleXEConnection;
import vo.AccountVO;
import vo.TradeRecordVO;

public class TradeRecordDAO {

   private Connection conn;
   private PreparedStatement pstmt=null;
   private ResultSet rs=null;
   private StringBuffer sb= new StringBuffer(); 
   
   
   
   public TradeRecordDAO() {
      conn=OracleXEConnection.getInstance().getConnection();
      try {
		conn.setAutoCommit(false);
	} catch (SQLException e) {
		e.printStackTrace();
	}
      System.out.println(conn);
   }


   public boolean TransferDeposit(AccountVO vo, String RecieveAccount, int money, String memo) {
      
      AccountDAO dao=new AccountDAO();
      
      int balance = vo.getBalance();
      
      AccountVO revo= new AccountVO();
      revo=dao.AccountInfoByAccount(RecieveAccount);
      //account 에서 조회하는 기능 추가
      
      boolean msg=false;
      
      if(balance>=money) {
         try {
            
            
            
            sb.setLength(0);
            sb.append("insert into traderecord ").append("values(?,?,?,?,?,sysdate,?,TRADE_PK_SEQ.nextval)");
            pstmt=conn.prepareStatement(sb.toString());
            pstmt.setString(1, "transfer");
            pstmt.setInt(2, 0);
            pstmt.setInt(3, money);
            pstmt.setString(4, vo.getAccount());
            pstmt.setString(5, memo);
            pstmt.setString(6, RecieveAccount);
            int b = pstmt.executeUpdate();
            vo.setBalance(balance-money);
            //받아온 AccountVO 두개에 업데이트 기능 추가 BALANCE값 바꾸기
            pstmt.close();
            
            sb.setLength(0);
            sb.append("update account ").append("set balance=? ").append("where account=?");
            pstmt=conn.prepareStatement(sb.toString());
            pstmt.setInt(1, balance-money);
            pstmt.setString(2,vo.getAccount());
            int a = pstmt.executeUpdate();
            pstmt.close();
            
            sb.setLength(0);
            sb.append("update account ").append("set balance=? ").append("where account=?");
            pstmt=conn.prepareStatement(sb.toString());
            pstmt.setInt(1, revo.getBalance()+money);
            pstmt.setString(2,RecieveAccount);
            if(pstmt.executeUpdate()==1 && b == 1 && a == 1) {
            	conn.commit();
            	msg=true;
            }else {
            	conn.rollback();
            }
            pstmt.close();
            
            
            
            
         } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
         }
         
         
      }
      
      else {
         try {
            conn.close();
         } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
         }
      }
      
      return msg;
      
      
      
   }
   
   public boolean withraw(AccountVO vo, int money) {
      boolean msg=false;
      
      int balance=vo.getBalance();
      
      if(balance>money) {
         sb.setLength(0);
         sb.append("insert into traderecord ").append("values(?,?,?,?,?,sysdate,?,TRADE_PK_SEQ.nextval)");
         try {
            pstmt=conn.prepareStatement(sb.toString());
            pstmt.setString(1, "withraw");
            pstmt.setInt(2, money);
            pstmt.setInt(3, 0);
            pstmt.setString(4, vo.getAccount());
            pstmt.setString(5, "");
            pstmt.setString(6, "Local");
            int a = pstmt.executeUpdate();
            pstmt.close();
            
            sb.setLength(0);
            sb.append("update account ").append("set balance=?").append("where account=?");
            pstmt=conn.prepareStatement(sb.toString());
            pstmt.setInt(1, (balance-money));
            pstmt.setString(2, vo.getAccount());
            if(pstmt.executeUpdate()==1 && a == 1) {
            	conn.commit();
            	msg=true;
            }else {
            	conn.rollback();
            }
            pstmt.close();
            
         } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
         }
      
         
      }
      
      return msg;
      
   }

   
   public boolean Deposit(AccountVO vo, int money) {
      boolean msg=false;
      
      
      int balance=vo.getBalance();
      
         sb.setLength(0);
         sb.append("insert into traderecord ").append("values(?,?,?,?,?,sysdate,?,TRADE_PK_SEQ.nextval)");
         try {
            pstmt=conn.prepareStatement(sb.toString());
            pstmt.setString(1, "Deposit");
            pstmt.setInt(2, money);
            pstmt.setInt(3, 0);
            pstmt.setString(4, "Local");
            pstmt.setString(5, "");
            pstmt.setString(6, vo.getAccount());
            int a = pstmt.executeUpdate();
            pstmt.close();
            
            sb.setLength(0);
            sb.append("update account ").append("set balance=? ").append("where account=?");
            pstmt=conn.prepareStatement(sb.toString());
            pstmt.setInt(1, (balance+money));
            pstmt.setString(2, vo.getAccount());
           // System.out.println(sb.toString());
            if(pstmt.executeUpdate()==1 && a== 1) {
            	conn.commit();
            	msg=true;
            }else {
            	conn.rollback();
            }
            pstmt.close();
            
         } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
         }
      
         
      
   
      return msg;
      
   }
   
   public ArrayList<TradeRecordVO> TradeView(AccountVO avo){
	      
	      ArrayList<TradeRecordVO> list= new ArrayList<>();
	      
	      sb.setLength(0);
	      sb.append("select * ").append("from TradeRecord ").append("where receiveaccount=? or sendaccount=? ").append("order by pk ");
	      try {
	         pstmt=conn.prepareStatement(sb.toString());
	         pstmt.setString(1, avo.getAccount());
	         pstmt.setString(2, avo.getAccount());
	         rs=pstmt.executeQuery();
	         while(rs.next()) {
	            TradeRecordVO tvo=new TradeRecordVO();
	            tvo.setWD(rs.getString(1));
	            tvo.setWithraw(rs.getInt(2));
	            tvo.setDeposit(rs.getInt(3));
	            tvo.setSendaccount(rs.getString(4));
	            tvo.setMemo(rs.getString(5));
	            tvo.setTradetime(rs.getString(6));
	            tvo.setReceiveaccount(rs.getString(7));
	            tvo.setPk(rs.getString(8));
	            
	            list.add(tvo);
	         }
	      } catch (SQLException e) {
	         // TODO Auto-generated catch block
	         e.printStackTrace();
	      }
	      
	      
	      return list;
	      
	   }
   
   
   

}
