package Json;

public class Jsonarraytest {
	public static void main(String[] args) {
		JsontoArray jta = new JsontoArray();
		
		
		Object[][] today=jta.ConvertToJson("C:\\Users\\soldesk\\web_workspace\\project\\WebContent\\Output.Json");
		Object[][] yesterday = jta.ConvertToJson("C:\\Users\\soldesk\\web_workspace\\project\\WebContent\\Outputyesterday.Json");
		
		Double[][] dtoday = new Double[22][11]; 
		Double[][] dyesterday = new Double[22][11]; 
		Double[][] abs = new Double[22][11]; 
		Double[][] dvide = new Double[22][11]; 
		
		for(int a = 0; a<22; a++) {
			for(int b = 10; b<11; b++) {
				dtoday[a][b] = Double.parseDouble((String) today[a][b]);
				dyesterday[a][b] = Double.parseDouble((String) yesterday[a][b]);
				
				System.out.println(dtoday[a][b]);
				
			}
		}
		
		
		
		
	}
}
