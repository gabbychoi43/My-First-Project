package vo;

public class TradeRecordVO {
   private String WD;
   private int withraw;
   private String sendaccount;
   private String receiveaccount;
   private String memo;
   private String tradetime;
   private String pk;
   private int Deposit;
   public int getDeposit() {
	return Deposit;
}

public void setDeposit(int deposit) {
	Deposit = deposit;
}

public TradeRecordVO() {
      // TODO Auto-generated constructor stub
   }

   public String getPk() {
      return pk;
   }

   public void setPk(String pk) {
      this.pk = pk;
   }

   public String getWD() {
      return WD;
   }

   public void setWD(String wD) {
      WD = wD;
   }

   public int getWithraw() {
      return withraw;
   }

   public void setWithraw(int withraw) {
      this.withraw = withraw;
   }

   public String getSendaccount() {
      return sendaccount;
   }

   public void setSendaccount(String sendaccount) {
      this.sendaccount = sendaccount;
   }

   public String getReceiveaccount() {
      return receiveaccount;
   }

   public void setReceiveaccount(String receiveaccount) {
      this.receiveaccount = receiveaccount;
   }

   public String getMemo() {
      return memo;
   }

   public void setMemo(String memo) {
      this.memo = memo;
   }

   public String getTradetime() {
      return tradetime;
   }

   public void setTradetime(String tradetime) {
      this.tradetime = tradetime;
   }
   
   
   

}