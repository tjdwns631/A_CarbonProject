package carbon.controller;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
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
	
	@RequestMapping("dashboarddatalist.do")
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
		//연간 직 간접 배출량 
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
		
		Map<String, Object> output = new HashMap<>();
		output.put("data_val_2", data_val_2); // 직접배출값
		output.put("data_val_10", data_val_10); // 간접배출값
		output.put("year", year_date); // 연도

		output.put("stack_data", Arr); // 직접배출값
		output.put("year", year_date); // 연도
		output.put("cate_nm", cate_nm);
		
		return output;
		
	}
	
	@RequestMapping("dashboardSelectList.do")
	@ResponseBody
	public Map<String, Object> dashboardSelectList(@RequestParam(value="year" , required = false) Integer year){
		
		System.out.println("year tear : "+year);
		
		Integer low_date = 2018;
		if(year == null) {
			low_date = 2018;
		}else {
			low_date = year;
		}
		
		System.out.println("low_date: "+low_date);
		/* 감축인벤토리 데이터 */
		List<CategoryDto> prdt_info =carbondataservice.SelectPrdtnm(); //감축인벤 활동자료명 가져옴
		log.info("prdt_info= {}", prdt_info);
		
		String[] prdt_nm = new String[prdt_info.size()]; // 감축 활동자료
		Integer[] Low_arr = new Integer[prdt_info.size()]; // 큰 배열->연도->작은배열->대분류변 데이터 입력
		
		for (int i = 0; i < prdt_info.size(); i++) { 
			prdt_nm[i] = prdt_info.get(i).getPrdt_nm();
			Low_arr[i] = 0;
		}
		System.out.println("prdt_nm : " + Arrays.deepToString(prdt_nm));
		
		
		List<CbntrdataDto> data3 = carbondataservice.SelectDatalow(low_date); //감축량
		log.info("date3= {}", data3);
		
		
		for (int i = 0; i < data3.size(); i++) {
			Low_arr[i] = data3.get(i).getData_val();
		}
		System.out.println("Low_arr : " + Arrays.deepToString(Low_arr));
		
		/* 총 배울량, 총 간접인벤, 직접배출량, 간접배출량 데이터 */
		
		Integer total_val =0; //총 배출량 lulu 뺸거
		Integer total_lu_val =0; //순 배출량 lulu 더한더 
		Integer di_val =0; //직접 배출
		Integer indi_val =0; // 간접 배출
		
		List<CbntrdataDto> data4 = carbondataservice.SelectData(low_date);
		
		for(int i = 0; i<data4.size(); i++) {
			total_lu_val += data4.get(i).getData_val();
			if(!data4.get(i).getLev_3().equals("LULUCF")) {
				total_val += data4.get(i).getData_val();
			}
			if(data4.get(i).getLev_2().equals("직접배출")) {
				di_val += data4.get(i).getData_val();
			}
			if(data4.get(i).getLev_2().equals("간접배출")) {
				indi_val += data4.get(i).getData_val();
			}
		}
		
		System.out.println("totla_val :" + total_val);
		System.out.println("total_lu_val :" + total_lu_val);
		System.out.println("di_val :" + di_val);
		System.out.println("indi_val :" + indi_val);
		
		Map<String, Object> output = new HashMap<>();
		//감축 인벤토리
		output.put("prdt_nm", prdt_nm); // 감축인벤 활동자료 명
		output.put("Low_arr", Low_arr);
		
		//선택 연도에 따른 값
		output.put("total_val", total_val); //총 배출량 lulu 뺸거
		output.put("total_lu_val", total_lu_val); //순 배출량 lulu 더한더
		output.put("di_val", di_val); //직접 배출
		output.put("indi_val", indi_val); //간접 배출
		output.put("year", low_date); //간접 배출
		
		return output;
		
	}
	
	@RequestMapping("desposeData.do")
	@ResponseBody
	public Map<String, Object> despose(@RequestParam(value="year" , required = false) Integer year){
		
		System.out.println("year tear : "+year);
		
		Integer low_date = 2018;
		if(year == null) {
			low_date = 2018;
		}else {
			low_date = year;
		}
		
		System.out.println("low_date: "+low_date);
		/* 감축인벤토리 데이터 */
		List<CategoryDto> category =carbondataservice.categorynm(); //
		
		
		String[] cate_nm = new String[category.size()]; // 
		Integer[] cate_sn = new Integer[category.size()];
		Integer[] Low_arr = new Integer[category.size()]; // 큰 배열->연도->작은배열->대분류별 데이터 입력
		
		for (int i = 0; i < category.size(); i++) { 
			cate_nm[i] = category.get(i).getCate_nm(); // 카테고리 명
			cate_sn[i] = category.get(i).getCate_sn(); // 카테고리 idx
			Low_arr[i] = 0; // 각 대분류별 데이터 
		}
		
		List<CbntrdataDto> data = carbondataservice.SelectData(low_date); //연별 배출량 데이터 조회
		
		log.info("category= {}", category);
		System.out.println("cate_nm : " + Arrays.deepToString(cate_nm));
		log.info("despose_date= {}", data);
		
		/*
		 * for (int i = 0; i < data.size(); i++) { for(int j =0; j<category.size(); j++)
		 * { if(data.get(i).getLev_3().equals(cate_nm[i])) {
		 * if(data.get(i).getCate_sn_3().equals(cate_sn[i])) { Low_arr[j] =
		 * data.get(i).getData_val(); } } } } System.out.println("Low_arr : " +
		 * Arrays.deepToString(Low_arr));
		 */
		
		/* 총 배울량, 총 간접인벤, 직접배출량, 간접배출량 데이터 */
		
		Integer total_val =0; //총 배출량 lulu 뺸거
		Integer total_lu_val =0; //순 배출량 lulu 더한더 
		Integer di_val =0; //직접 배출
		Integer indi_val =0; // 간접 배출
		
		List<CbntrdataDto> data4 = carbondataservice.SelectData(low_date);
		
		for(int i = 0; i<data4.size(); i++) {
			total_lu_val += data4.get(i).getData_val();
			if(!data4.get(i).getLev_3().equals("LULUCF")) {
				total_val += data4.get(i).getData_val();
			}
			if(data4.get(i).getLev_2().equals("직접배출")) {
				di_val += data4.get(i).getData_val();
			}
			if(data4.get(i).getLev_2().equals("간접배출")) {
				indi_val += data4.get(i).getData_val();
			}
		}
		
		System.out.println("totla_val :" + total_val);
		System.out.println("total_lu_val :" + total_lu_val);
		System.out.println("di_val :" + di_val);
		System.out.println("indi_val :" + indi_val);
		
		Map<String, Object> output = new HashMap<>();
		//감축 인벤토리
		output.put("cate_nm", cate_nm); // 감축인벤 활동자료 명
		output.put("Low_arr", Low_arr);
		
		//선택 연도에 따른 값
		output.put("total_val", total_val); //총 배출량 lulu 뺸거
		output.put("total_lu_val", total_lu_val); //순 배출량 lulu 더한더
		output.put("di_val", di_val); //직접 배출
		output.put("indi_val", indi_val); //간접 배출
		output.put("year", low_date); //간접 배출
		
		return output;
		
	}
	
}



