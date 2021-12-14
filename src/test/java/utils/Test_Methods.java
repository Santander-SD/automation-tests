package utils;

import java.io.FileReader;
import java.io.IOException;
import java.util.Iterator;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

public class Test_Methods {

	@SuppressWarnings("unchecked")
	public static JSONObject getJsonDataTest(String key) {

		JSONObject jsonValue = null;
		JSONParser parser = new JSONParser();

		try {
			Object obj = parser.parse(new FileReader("src/test/resources/dataTest/cards.json"));
			JSONObject jsonObject = (JSONObject) obj;
			JSONArray scenarioList = (JSONArray) jsonObject.get(key);

			Iterator<JSONObject> scenarioListIterator = scenarioList.iterator();

			while (scenarioListIterator.hasNext()) {
				jsonValue = scenarioListIterator.next();
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return jsonValue;
	}
	
	
	public static String getJsonValueTest(String scenarioId, String inputJson) {
		JSONObject j = (JSONObject) getJsonDataTest(scenarioId);
		return  j.get(inputJson).toString();
	}
	
	public static String[] getValueListJson(String list) {
		String[] listArrayJson;
		
		listArrayJson = list.replace("[", "").replace("]", "").replace("\"","").split(",");
		
		return listArrayJson;
	}

	public static void main(String[] args) throws IOException {	
		System.out.println(getJsonValueTest("ce016", "country"));
		
		for (String readyList : getValueListJson(getJsonValueTest("ce016", "validateList"))) {
			System.out.println(readyList);
		}
		
		
		//System.out.println(getValueListJson(getJsonValueTest("ce016", "validateList")));

	}

}
