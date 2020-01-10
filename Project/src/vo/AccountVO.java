package vo;

public class AccountVO {
   private String memberid;
   private String membername;
   private String account;
   private int balance;
   private String accountpw;
   
   
   public AccountVO() {
      // TODO Auto-generated constructor stub
   }
   
   

   public AccountVO(String memberid, String membername, String account, int balance, String accountpw) {
	super();
	this.memberid = memberid;
	this.membername = membername;
	this.account = account;
	this.balance = balance;
	this.accountpw = accountpw;
}



public String getMemberid() {
      return memberid;
   }


   public void setMemberid(String memberid) {
      this.memberid = memberid;
   }


   public String getMembername() {
      return membername;
   }


   public void setMembername(String membername) {
      this.membername = membername;
   }


   public String getAccount() {
      return account;
   }


   public void setAccount(String account) {
      this.account = account;
   }


   public int getBalance() {
      return balance;
   }


   public void setBalance(int balance) {
      this.balance = balance;
   }


   public String getAccountpw() {
      return accountpw;
   }


   public void setAccountpw(String accountpw) {
      this.accountpw = accountpw;
   }
   
   

}