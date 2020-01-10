package vo;

import java.util.Date;

public class MemberVO {
   private String memberid;
   private String memberpw;
   private String membername;
   private String memberbirth;
   private String memberphoneno;
   private Date regdate;
   
   
   public MemberVO() {
      super();
   }
   
   


   public MemberVO(String memberid, String memberpw, String membername, String memberbirth, String memberphoneno) {
      super();
      this.memberid = memberid;
      this.memberpw = memberpw;
      this.membername = membername;
      this.memberbirth = memberbirth;
      this.memberphoneno = memberphoneno;
      this.regdate = regdate;
   }
   
   
   //id 찾기
   public MemberVO(String memberid, String membername, String memberbirth) {
      super();
      this.memberid = memberid;
      this.membername = membername;
      this.memberbirth = memberbirth;
   }
   
   //pw 찾기
   
   public MemberVO(String memberpw, String memberbirth, String memberid, String name) {
      super();
      this.memberid = memberid;
      this.memberpw = memberpw;
      this.memberbirth = memberbirth;
      this.membername = membername;
   
   }
   
   

   public String getMemberid() {
      return memberid;
   }








   public void setMemberid(String memberid) {
      this.memberid = memberid;
   }


   public String getMemberpw() {
      return memberpw;
   }


   public void setMemberpw(String memberpw) {
      this.memberpw = memberpw;
   }


   public String getMembername() {
      return membername;
   }


   public void setMembername(String membername) {
      this.membername = membername;
   }


   public String getMemberbirth() {
      return memberbirth;
   }


   public void setMemberbirth(String memberbirth) {
      this.memberbirth = memberbirth;
   }


   public String getmemberphoneno() {
      return memberphoneno;
   }


   public void setmemberphoneno(String memberphoneno) {
      this.memberphoneno = memberphoneno;
   }


   public Date getRegdate() {
      return regdate;
   }


   public void setRegdate(Date regdate) {
      this.regdate = regdate;
   }   

}
   
   