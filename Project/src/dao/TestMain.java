package dao;

import java.util.ArrayList;

import vo.AccountVO;
import vo.MemberVO;
import vo.TradeRecordVO;

public class TestMain {
	public static void main(String[] args) {
		AccountDAO dao = new AccountDAO();
		
		//AccountVO vo = new AccountVO();
		
		//계좌 생성 테스트
		/*vo.setAccount("301-2666-3662");
		vo.setMemberid("wtk1267");
		vo.setMembername("우태균");
		vo.setBalance(3000);
		vo.setAccountpw("1234");
		
		dao.addAccount(vo);*/
		
		//계좌번호를 통한 계좌 조회 테스트
		/*vo = dao.AccountInfoByAccount("301-2666-3662");
		
		System.out.println("계좌번호 : " + vo.getAccount()
							+"아이디 : " + vo.getMemberid()
							+"이름 : " + vo.getMembername()
							+"잔고 : " + vo.getBalance()
							+"비밀번호 : " + vo.getAccountpw());*/
		
		//아이디를 통한 계좌 조회 테스트
/*		ArrayList<AccountVO> list = new ArrayList<>(); 
		
		
		list = dao.AccountInfoById("wtk1267");
		
		for(AccountVO vo : list) {
			System.out.println(vo.getAccount()+vo.getBalance());
		}*/
		
		// 계좌 삭제
		/*dao.deleteAccount("301-2666-3662", "1234");*/
		
	/*	TradeRecordDAO dao1 = new TradeRecordDAO();
		vo = dao.AccountInfoByAccount("301-2666-3662");
		dao1.Deposit(vo, 500);
		
		dao1.TransferDeposit(vo, "1234567-8910", 1000, "test");*/
		
		/*
		MemberDAO dao = new MemberDAO();
	      MemberVO vo = new MemberVO();
	      */
	       
	      // 1. 회원가입
	      
	      
	      /*vo.setMemberid("Choi");
	      vo.setMemberpw("1234");
	      vo.setMembername("최고");
	      vo.setMemberbirth("900101");
	      vo.setMemberPhoneno("0104235748");
	      
	      dao.addData(vo);*/
	      
	      
	      // 2. 회원정보 수정 (null처리로 인한 부분수정 불가능)
	   
	      
	/*      vo.setMemberid("Choi");
	      vo.setMembername("최불암");
	      vo.setMemberpw("5678");
	      vo.setMemberbirth("900404");
	      vo.setMemberPhoneno("22154");
	   
	      dao.updateAll(vo);*/
	      
	      
	      
	      // 3. id 찾기
	      
	      /*
	      String vo2 = dao.findId("최불암", "900404"); 
	      System.out.println(vo2);
	      */
	      
	      
	      
	      // 4. pw 찾기
	      
	      /*
	      String vo2 = dao.findPw("Choi", "900404"); 
	      System.out.println(vo2);
	      */
	      
	      // 5. 회원탈퇴
/*	      
	      dao.DeleteOne("5678");
*/
		
		TradeRecordDAO tdao = new TradeRecordDAO();
		AccountVO avo = new AccountVO();
		ArrayList<TradeRecordVO> list = new ArrayList<>();
		dao.AccountInfoByAccount("1234567-8910");
		
		list = tdao.TradeView(avo);
		
		
		
		System.out.println(list);
		
		
		
		
		
	}
}
