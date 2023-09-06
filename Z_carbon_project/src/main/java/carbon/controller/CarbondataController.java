package carbon.controller;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import carbon.dto.CategoryDto;
import carbon.dto.CbntrdataDto;
import carbon.service.CarbondataService;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class CarbondataController {
	
	@Autowired
	CarbondataService carbondataservice;
	
	@RequestMapping("dashbarddataList.do")
	@ResponseBody
	public Map<String, Object> DashboardDataList(){

		Integer[] year_date = { 2015, 2016, 2017, 2018, 2019, 2020 }; // 추후 db에서 값 가져오기

		Integer[] data_val_2 = new Integer[year_date.length]; // 직접배출
		Integer[] data_val_10 = new Integer[year_date.length]; // 간접배출
		for (int i = 0; i < year_date.length; i++) { // 년노별 초기화
			data_val_2[i] = 0;
			data_val_10[i] = 0;
		}
		System.out.println("year_date ; " + Arrays.toString(year_date));
		System.out.println("data_val_2 ; " + Arrays.toString(data_val_2));

		List<CbntrdataDto> data = carbondataservice.SelectDatayear();
		log.info("list={}", data);

		for (int i = 0; i < data.size(); i++) {
			for (int j = 0; j < year_date.length; j++) {
				if (data.get(i).getData_date().equals(year_date[j])) {
					if (data.get(i).getLev_2().equals("직접배출")) {
						data_val_2[j] += data.get(i).getData_val();
					} else if (data.get(i).getLev_2().equals("간접배출")) {
						data_val_10[j] += data.get(i).getData_val();
					}
				}
			}
		}

		System.out.println("ㅇㅇㅇdata_val_2 ; " + Arrays.toString(data_val_2));
		System.out.println("ㅇㅇㅇdata_val_10 ; " + Arrays.toString(data_val_10));

		List<CategoryDto> category = carbondataservice.categorynm(); // 대분류 카테고리 가져오기
		log.info("list={}", category);
		Integer[] cate_sn = new Integer[category.size()]; // 카테고리 키값
		String[] cate_nm = new String[category.size()]; // 카테고리 키값

		for (int i = 0; i < category.size(); i++) { // 대분류별 초기화
			cate_sn[i] = category.get(i).getCate_sn(); // 카테고리 idx
			cate_nm[i] = category.get(i).getCate_nm(); // 카테고리 명
		}
		
		System.out.println("sn : " + Arrays.toString(cate_sn));
		System.out.println("nm : " + Arrays.toString(cate_nm));

		Integer[][] Arr = new Integer[category.size()][year_date.length]; // 큰 배열->연도->작은배열->대분류변 데이터 입력

		for (int i = 0; i < category.size(); i++) { // 대분류별 초기화
			for (int j = 0; j < year_date.length; j++) {
				Arr[i][j] = 0;
			}
		}
		
		System.out.println("arrData1 : " + Arrays.deepToString(Arr));

		List<CbntrdataDto> data2 = carbondataservice.SelectDataStack();
		log.info("data_list= {}", data2);
		// 각 lulucf 농업 산업공정 에너지 전력 해서 카테고리 담아야함
		for (int i = 0; i < data2.size(); i++) {
			for (int j = 0; j < category.size(); j++) {
				for (int y = 0; y < year_date.length; y++) {
					if (data2.get(i).getData_date().equals(year_date[y])) {
						if (data2.get(i).getCate_sn_3().equals(cate_sn[j])) {
							Arr[j][y] = data2.get(i).getData_val(); // 카테고리별 연간 데이터
						}
					}
				}
			}
		}

		System.out.println("result : " + Arrays.deepToString(Arr));
		
		/* 총 배울량, 총 간접인벤, 직접배출량, 간접배출량 데이터 */
		

		Map<String, Object> output = new HashMap<>();
		output.put("data_val_2", data_val_2); // 직접배출값
		output.put("data_val_10", data_val_10); // 간접배출값
		output.put("year", year_date); // 연도

		output.put("stack_data", Arr); // 직접배출값
		output.put("year", year_date); // 연도
		output.put("cate_nm", cate_nm);
		
		return output;
		
	}
	
	@RequestMapping("dashbarddataListstack.do")
	@ResponseBody
	public String DashboardDataListStarck(){
		
		Integer a = -11000;
		Integer b = -12000;
		System.out.println("a+b : "+(a+b));
		
//		output.put("data_val_10", data_val_10); // 간접배출값

		return "";
		
	}
	
}


