package carbon.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@RequestMapping("/map")
@Controller
public class MapController {

	@RequestMapping("/map_test.do")
	public String admin_data() {
		return "map/map_test";
	}

	@RequestMapping("/test_m.do")
	public String tests() {
		return "map/test_m";
	}

	@RequestMapping("/cctvapi.do")
	public String cctvapi() {
		return "map/cctvapi";
	}

	@RequestMapping("/test_marker.do")
	public String test_marker() {
		return "map/test_marker";
	}
	
	@RequestMapping("/mt.do")
	public String mt() {
		return "map/mt";
	}
	
	@RequestMapping("/ttttt.do")
	public String ttttt() {
		return "map/ttttt";
	}
	@RequestMapping("/map_new_lay.do")
	public String map_new_lay() {
		return "map/map_new_lay";
	}
	
	@ResponseBody
	@RequestMapping("/cctvapidata.do")
	public Map<String, Object> cctvapidata() throws IOException, ParseException {

		StringBuilder urlBuilder = new StringBuilder("https://openapi.its.go.kr:9443/cctvInfo"); /* URL */
		urlBuilder.append("?" + URLEncoder.encode("apiKey", "UTF-8") + "=" + URLEncoder.encode("ff3ec7dc6e664696b835a21fb1003bc9", "UTF-8")); /* 공개키 */
		urlBuilder.append("&" + URLEncoder.encode("type","UTF-8") + "=" + URLEncoder.encode("ex", "UTF-8")); /*도로유형*/
		urlBuilder.append("&" + URLEncoder.encode("cctvType","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*CCTV유형*/
		urlBuilder.append("&" + URLEncoder.encode("minX","UTF-8") + "=" + URLEncoder.encode("123.800000", "UTF-8")); /*최소경도영역*/
		urlBuilder.append("&" + URLEncoder.encode("maxX","UTF-8") + "=" + URLEncoder.encode("137.890000", "UTF-8")); /*최대경도영역*/
		urlBuilder.append("&" + URLEncoder.encode("minY","UTF-8") + "=" + URLEncoder.encode("33.900000", "UTF-8")); /*최소위도영역*/
		urlBuilder.append("&" + URLEncoder.encode("maxY","UTF-8") + "=" + URLEncoder.encode("47.100000", "UTF-8")); /*최대위도영역*/
		urlBuilder.append("&" + URLEncoder.encode("getType","UTF-8") + "=" + URLEncoder.encode("json", "UTF-8")); /*출력타입*/
		URL url = new URL(urlBuilder.toString());
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		conn.setRequestMethod("GET");
		conn.setRequestProperty("Content-type", "text/html;charset=UTF-8");
		System.out.println("Response code: " + conn.getResponseCode());
		BufferedReader rd;
		if (conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
			rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
		} else {
			rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
		}
		StringBuilder sb = new StringBuilder();
		String line;
		while ((line = rd.readLine()) != null) {
			sb.append(line);
		}
		rd.close();
		conn.disconnect();
		//System.out.println(sb.toString());
		
		
		//json 값으로 변환 \ 제거 (역슬래시 제거)
		String data = sb.toString();
		
		JSONParser jsonParse = new JSONParser();
		JSONObject jsonObj = (JSONObject) jsonParse.parse(data);
		
		Map<String, Object> output = new HashMap<>();
		output.put("data", jsonObj);

		return output;
	  
	  }
	  
	  @ResponseBody
	  @RequestMapping("/cct.do") 
	  public String cct() {
	  
	  String result = "testet";
	  
	  return result;
	  
	  }
	  
}
