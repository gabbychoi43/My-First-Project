package connection;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.Locale;

public class teesst {

	public static void main(String[] args) {
		
		// 1. 날짜 표시 format


		// 2. 오늘날짜 Data 클래스로 구하기(기준날짜가 오늘이 아니면 생략가능)
/*
		Date today = new Date();
*/
		// 3. 오늘날짜 format에 맞춰서 String 으로 변경(기준날짜가 오늘이 아니면 생략가능)

//		String date =  formatter.format(today);



		// 5. 한국 날짜 기준 Calendar 클래스 선언

		//Calendar cal = new GregorianCalendar(Locale.KOREA);
		// 7. 하루전으로 날짜 설정


		// 8. 하루전으로 설정된 날짜를 설정된 format으로 String 타입 변경

		
		SimpleDateFormat  formatter = new SimpleDateFormat("yyyy"+"MM"+"dd");    
		Calendar cal = Calendar.getInstance();
		cal.add(Calendar.DATE, -1);
		String y_date = formatter.format(cal.getTime());
		System.out.println(y_date);
	}
}
