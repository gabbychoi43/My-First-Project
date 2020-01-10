package Json;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.HashMap;


import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

public class JsontoArray {
   
   public String[][] ConvertToJson (String realpath) {
      
      BufferedReader br=null;
      StringBuffer sb= new StringBuffer();
      String str="";

      try {
         br= new BufferedReader(new FileReader(realpath));
         str=br.readLine().toString();
         
      } catch (FileNotFoundException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      } catch (IOException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      }
      //System.out.println();
      str = str.replaceAll("\\uFEFF" , "");
      JSONParser parser = new JSONParser();
      JSONArray jsonArray = new JSONArray();
      try {
         Object obj=parser.parse(str);
         jsonArray=(JSONArray)obj;
      } catch (ParseException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      }
      JSONObject jobj=(JSONObject)jsonArray.get(1);
      
      Object[][] o=new Object[22][11];
      //사용할 객체
      for(int i=0;i<22;i++) {
         o[i]=((HashMap) jsonArray.get(i)).values().toArray();
         for(int j=0;j<11;j++) {
            System.out.print(o[i][j]+"  ");

            
         }
         System.out.println();
      }
      String[][] s= new String[22][11];
      for(int i=0;i<22;i++) {
         for(int j=0;j<11;j++) {
            s[i][j]=o[i][j].toString();
            s[i][j]=s[i][j].replaceAll(",","");
         }
      }
      return s;
      
   }

}