package Crawl;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.net.MalformedURLException;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Formatter;

import net.htmlparser.jericho.Source;

public class CrawlMain { 
	
	
	
		
   public void info() {
	   
	   
      SimpleDateFormat cw= new SimpleDateFormat("yyyy"+"MM"+"dd");
      Calendar cal = Calendar.getInstance();
      cal.add(Calendar.DATE, -1); 
      String yesterday = cw.format(cal.getTime());
      
      String url="https://www.koreaexim.go.kr/site/program/financial/exchangeJSON?authkey=BrUzAsfYhG2I3Wi77IAErFHuklG0Iuxq&searchdate="+cw.format(new Date())+"&data=AP01";

      BufferedOutputStream bos=null;
            
           Source source;
         try {
            bos= new BufferedOutputStream(new FileOutputStream("C:\\Users\\soldesk\\web_workspace\\project\\WebContent\\Output.Json"));
            source = new Source(new URL(url));
            System.out.println(source);
            source.fullSequentialParse();
            System.out.println(source);
            bos.write(source.toString().getBytes());
            bos.flush();
            //bos.close();
         } catch (MalformedURLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
         } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
         }finally {
         }
       }
   }
   

