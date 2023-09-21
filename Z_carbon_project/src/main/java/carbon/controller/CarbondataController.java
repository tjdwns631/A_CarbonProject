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
	
	@RequestMapping("DashboardDataList.do")
	@ResponseBody
	//연도별 배출량 데이터 및 스택 라인그래프 데이터(이건 사용 x)
	public Map<String, Object> DashboardDataList(){ 

		Integer[] year_date = { 2015, 2016, 2017, 2018, 2019, 2020 }; // 추후 db에서 값 가져오기
		Integer[] data_val_2 = new Integer[year_date.length]; // 직접배출
		Integer[] data_val_10 = new Integer[year_date.length]; // 간접배출
		
		for (int i = 0; i < year_date.length; i++) { // 년노별 초기화
			data_val_2[i] = 0;
			data_val_10[i] = 0;
		}

		List<CbntrdataDto> data = carbondataservice.SelectDatayear();
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

		List<CategoryDto> category = carbondataservice.categorynm(); // 대분류 카테고리 가져오기
		Integer[] cate_sn = new Integer[category.size()]; // 카테고리 키값
		String[] cate_nm = new String[category.size()]; // 카테고리 키값

		for (int i = 0; i < category.size(); i++) { // 대분류별 초기화
			cate_sn[i] = category.get(i).getCate_sn(); // 카테고리 idx
			cate_nm[i] = category.get(i).getCate_nm(); // 카테고리 명
		}
		
		Integer[][] Arr = new Integer[category.size()][year_date.length]; // 큰 배열->연도->작은배열->대분류변 데이터 입력

		for (int i = 0; i < category.size(); i++) { // 대분류별 초기화
			for (int j = 0; j < year_date.length; j++) {
				Arr[i][j] = 0;
			}
		}
		
		List<CbntrdataDto> data2 = carbondataservice.SelectDataStack();
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

		Map<String, Object> output = new HashMap<>();
		output.put("data_val_2", data_val_2); // 직접배출값
		output.put("data_val_10", data_val_10); // 간접배출값
		output.put("year_date", year_date); // 연도

		output.put("stack_data", Arr); // 직접배출값
		output.put("year_date", year_date); // 연도
		output.put("cate_nm", cate_nm);
		
		return output;
		
	}
	
	@RequestMapping("DashboardSelectList.do")
	@ResponseBody 
	//선택 연도별 감축량 데이터 및 배출량 데이터 조회 
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
		String cate_name= null;
		List<CategoryDto> prdt_info =carbondataservice.SelectLowPrdtnm(cate_name); //감축인벤 활동자료명 가져옴
		log.info("prdt_info= {}", prdt_info);
		
		String[] prdt_nm = new String[prdt_info.size()]; // 감축 활동자료
		Integer[] Low_arr = new Integer[prdt_info.size()]; // 큰 배열->연도->작은배열->대분류변 데이터 입력
		
		for (int i = 0; i < prdt_info.size(); i++) { 
			prdt_nm[i] = prdt_info.get(i).getPrdt_nm();
			Low_arr[i] = 0;
		}
		System.out.println("prdt_nm : " + Arrays.deepToString(prdt_nm));
		
		
		List<CbntrdataDto> data3 = carbondataservice.SelectLowData(low_date); //감축량
		log.info("date3= {}", data3);
		
		Integer total_low_val =0; //총 감축 배출량
		Integer di_low_val =0; //직접 배출
		Integer indi_low_val =0; // 간접 배출
		
		for (int i = 0; i < data3.size(); i++) {
			Low_arr[i] = data3.get(i).getData_val();
			total_low_val += data3.get(i).getData_val();
			if(!data3.get(i).getLev_3().equals("LULUCF")) {
				if(data3.get(i).getLev_2().equals("직접배출")) {
					di_low_val += data3.get(i).getData_val();
				}
				if(data3.get(i).getLev_2().equals("간접배출")) {
					indi_low_val += data3.get(i).getData_val();
				}
			}
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
				if(data4.get(i).getLev_2().equals("직접배출")) {
					di_val += data4.get(i).getData_val();
				}
				if(data4.get(i).getLev_2().equals("간접배출")) {
					indi_val += data4.get(i).getData_val();
				}
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
		output.put("total_low_val", total_low_val); //총 배출량 lulu 뺸거
		output.put("di_low_val", di_low_val); //직접 배출
		output.put("indi_low_val", indi_low_val); //간접 배출
		
		//선택 연도에 따른 값
		output.put("total_val", total_val); //총 배출량 lulu 뺸거
		output.put("total_lu_val", total_lu_val); //순 배출량 lulu 더한더
		output.put("di_val", di_val); //직접 배출
		output.put("indi_val", indi_val); //간접 배출
		output.put("year", low_date); // 선택연도
		
		return output;
		
	}
	
	@RequestMapping("desposeData.do")
	@ResponseBody
	public Map<String, Object> despose(@RequestParam(value="year" , required = false) Integer year){
		
		Integer low_date = 2018;
		if(year == null) {
			low_date = 2018;
		}else {
			low_date = year;
		}
		
		List<CategoryDto> category =carbondataservice.categorynm(); //대분류 카테고리명 (에너지 산업공정 등)
		List<CategoryDto> catecount = carbondataservice.CategoryCount(); //카레고리별 총갯수(에너지 6개, 산업공정 1개 등)
		
		String[] cate_nm = new String[category.size()]; // 
		Integer[] cate_sn = new Integer[category.size()];
		Integer[] Low_arr = new Integer[category.size()]; // 큰 배열->연도->작은배열->대분류별 데이터 입력
		Integer max = catecount.get(0).getCount();

		for (int i = 0; i < catecount.size(); i++) {// 카테고리수 최대값 구하기
			max = Math.max(max, catecount.get(i).getCount());
		}
		Integer[][] Arr = new Integer[category.size()][max];
		for (int i = 0; i < category.size(); i++) {
			if(category.get(i).getCate_upr_sn().equals(2)) {
				cate_nm[i] = category.get(i).getCate_nm()+"(직접)"; // 대분류 카테고리 명
			}else {
				cate_nm[i] = category.get(i).getCate_nm(); // 대분류 카테고리 명
			}
			cate_sn[i] = category.get(i).getCate_sn(); // 대분류 카테고리 idx
			Low_arr[i] = 0; // 각 대분류별 데이터 
			for(int j = 0; j < catecount.get(i).getCount(); j++) {
				Arr[i][j] = 0;
			}
		}
		
		String[] cata_name ={"에너지","산업공정","농업","LULUCF","폐기물","전력(간접)","폐기물(간접)"};
		List<CategoryDto> prdt_info_energy =carbondataservice.SelectviPrdtnm(cata_name[0]); //배출인벤 에너지 활동자료명 가져옴
		log.info("prdt_info_energyprdt_info_energy= {}", prdt_info_energy);
		/**/
		String[] energy_nm = new String[catecount.get(0).getCount()];
		Integer[] energy_sn = new Integer[catecount.get(0).getCount()];
		Integer[] energy_val = new Integer[catecount.get(0).getCount()];
		for(int i =0; i<prdt_info_energy.size(); i++) {
			energy_sn[i] = prdt_info_energy.get(i).getPrdt_sn();
			energy_nm[i] = prdt_info_energy.get(i).getPrdt_nm();
			energy_val[i] = 0;
		}
		/**/
		String[] indus_nm  = new String[catecount.get(1).getCount()];
		Integer[] indus_sn = new Integer[catecount.get(1).getCount()];
		Integer[] indus_val = new Integer[catecount.get(1).getCount()];
		List<CategoryDto> prdt_info_indus =carbondataservice.SelectviPrdtnm(cata_name[1]); //배출인벤 에너지 활동자료명 가져옴
		for(int i =0; i<prdt_info_indus.size(); i++) {
			indus_sn[i] = prdt_info_indus.get(i).getPrdt_sn();
			indus_nm [i] = prdt_info_indus.get(i).getPrdt_nm();
			indus_val[i] = 0;
		}
		/**/
		String[] agri_nm  = new String[catecount.get(2).getCount()];
		Integer[] agri_sn = new Integer[catecount.get(2).getCount()];
		Integer[] agri_val = new Integer[catecount.get(2).getCount()];
		List<CategoryDto> prdt_info_agri =carbondataservice.SelectviPrdtnm(cata_name[2]); //배출인벤 에너지 활동자료명 가져옴
		for(int i =0; i<prdt_info_agri.size(); i++) {
			agri_sn[i] = prdt_info_agri.get(i).getPrdt_sn();
			agri_nm [i] = prdt_info_agri.get(i).getPrdt_nm();
			agri_val[i] = 0;
		}
		/**/
		String[] lulucf_nm  = new String[catecount.get(3).getCount()];
		Integer[] lulucf_sn = new Integer[catecount.get(3).getCount()];
		Integer[] lulucf_val = new Integer[catecount.get(3).getCount()];
		List<CategoryDto> prdt_info_lulucf =carbondataservice.SelectviPrdtnm(cata_name[3]); //배출인벤 에너지 활동자료명 가져옴
		for(int i =0; i<prdt_info_lulucf.size(); i++) {
			lulucf_sn[i] = prdt_info_lulucf.get(i).getPrdt_sn();
			lulucf_nm [i] = prdt_info_lulucf.get(i).getPrdt_nm();
			lulucf_val[i] = 0;
		}
		/**/
		String[] waste_nm  = new String[catecount.get(4).getCount()];
		Integer[] waste_sn = new Integer[catecount.get(4).getCount()];
		Integer[] waste_val = new Integer[catecount.get(4).getCount()];
		List<CategoryDto> prdt_info_waste =carbondataservice.SelectviPrdtnm(cata_name[4]); //배출인벤 에너지 활동자료명 가져옴
		for(int i =0; i<prdt_info_waste.size(); i++) {
			waste_sn[i] = prdt_info_waste.get(i).getPrdt_sn();
			waste_nm [i] = prdt_info_waste.get(i).getPrdt_nm();
			waste_val[i] = 0;
		}
		/**/
		String[] elect_nm  = new String[catecount.get(5).getCount()];
		Integer[] elect_sn = new Integer[catecount.get(5).getCount()];
		Integer[] elect_val = new Integer[catecount.get(5).getCount()];
		List<CategoryDto> prdt_info_elect =carbondataservice.SelectviPrdtnm(cata_name[5]); //배출인벤 에너지 활동자료명 가져옴
		for(int i =0; i<prdt_info_elect.size(); i++) {
			elect_sn[i] = prdt_info_elect.get(i).getPrdt_sn();
			elect_nm [i] = prdt_info_elect.get(i).getPrdt_nm();
			elect_val[i] = 0;
		}
		/**/
		String[] indiwaste_nm  = new String[catecount.get(6).getCount()];
		Integer[] indiwaste_sn = new Integer[catecount.get(6).getCount()];
		Integer[] indiwaste_val = new Integer[catecount.get(6).getCount()];
		List<CategoryDto> prdt_info_indiwaste =carbondataservice.SelectviPrdtnm(cata_name[6]); //배출인벤 에너지 활동자료명 가져옴
		for(int i =0; i<prdt_info_indiwaste.size(); i++) {
			indiwaste_sn[i] = prdt_info_indiwaste.get(i).getPrdt_sn();
			indiwaste_nm [i] = prdt_info_indiwaste.get(i).getPrdt_nm();
			indiwaste_val[i] = 0;
		}
		
		Integer energy_sum = 0;
		Integer indus_sum = 0;
		Integer agri_sum = 0;
		Integer lulucf_sum = 0;
		Integer waste_sum = 0;
		Integer elect_sum = 0;
		Integer indiwaste_sum = 0;
		List<CbntrdataDto> data = carbondataservice.SelectData(low_date); //연별 배출량 데이터 조회
		for(int i=0; i<data.size(); i++) {
			for(int a=0; a<energy_sn.length; a++) {
				if(data.get(i).getPrdt_sn().equals(energy_sn[a])) {energy_sum += data.get(i).getData_val();energy_val[a] = data.get(i).getData_val();}
			}
			for(int b=0; b<indus_sn.length; b++) {
				if(data.get(i).getPrdt_sn().equals(indus_sn[b])) {indus_sum += data.get(i).getData_val();indus_val[b] = data.get(i).getData_val();}
			}
			for(int c=0; c<agri_sn.length; c++) {
				if(data.get(i).getPrdt_sn().equals(agri_sn[c])) {agri_sum += data.get(i).getData_val();agri_val[c] = data.get(i).getData_val();}
			}
			for(int d=0; d<lulucf_sn.length; d++) {
				if(data.get(i).getPrdt_sn().equals(lulucf_sn[d])) {lulucf_sum += data.get(i).getData_val();lulucf_val[d] = data.get(i).getData_val();}
			}
			for(int e=0; e<waste_sn.length; e++) {
				if(data.get(i).getPrdt_sn().equals(waste_sn[e])) {waste_sum += data.get(i).getData_val();waste_val[e] = data.get(i).getData_val();}
			}
			for(int f=0; f<elect_sn.length; f++) {
				if(data.get(i).getPrdt_sn().equals(elect_sn[f])) {elect_sum += data.get(i).getData_val();elect_val[f] = data.get(i).getData_val();}
			}
			for(int g=0; g<indiwaste_sn.length; g++) {
				if(data.get(i).getPrdt_sn().equals(indiwaste_sn[g])) {indiwaste_sum += data.get(i).getData_val();indiwaste_val[g] = data.get(i).getData_val();}
			}
		}
		
		/* 총 배울량, 총 간접인벤, 직접배출량, 간접배출량 데이터 */
		for (int i = 0; i < category.size(); i++) {
			Low_arr[i] = 0; // 각 대분류별 데이터 
		}
		for (int i = 0; i < data.size(); i++) {
			for(int j =0; j<category.size(); j++) {
				if(data.get(i).getCate_sn_3().equals(cate_sn[j])) {
					Low_arr[j] += data.get(i).getData_val();
				}
			}
		}
		
		Integer total_val =0; //총 배출량 lulu 뺸거
		Integer total_lu_val =0; //순 배출량 lulu 더한더 
		Integer di_val =0; //직접 배출
		Integer indi_val =0; // 간접 배출
		
		List<CbntrdataDto> data4 = carbondataservice.SelectData(low_date);
		
		for(int i = 0; i<data4.size(); i++) {
			total_lu_val += data4.get(i).getData_val();
			if(!data4.get(i).getLev_3().equals("LULUCF")) {
				total_val += data4.get(i).getData_val();
				if(data4.get(i).getLev_2().equals("직접배출")) {
					di_val += data4.get(i).getData_val();
				}
				if(data4.get(i).getLev_2().equals("간접배출")) {
					indi_val += data4.get(i).getData_val();
				}
			}
			
		}
		
		Map<String, Object> output = new HashMap<>();

		output.put("cate_nm", cate_nm); // 배출인벤 활동자료 명
		output.put("Low_arr", Low_arr); // 각 대분류별 데이터
		
		//선택 연도에 따른 값
		output.put("total_val", total_val); //총 배출량 lulu 뺸거
		output.put("total_lu_val", total_lu_val); //순 배출량 lulu 더한더
		output.put("di_val", di_val); //직접 배출
		output.put("indi_val", indi_val); //간접 배출
		output.put("year", low_date); //간접 배출
		
		//대분류 별 데이터
		output.put("energy_nm", energy_nm); //
		output.put("energy_val", energy_val); //
		output.put("energy_sum", energy_sum); //
		output.put("indus_nm", indus_nm); //
		output.put("indus_val", indus_val); //
		output.put("indus_sum", indus_sum); //
		output.put("agri_nm", agri_nm); //
		output.put("agri_val", agri_val); //
		output.put("agri_sum", agri_sum); //
		output.put("lulucf_nm", lulucf_nm); //
		output.put("lulucf_val", lulucf_val); //
		output.put("lulucf_sum", lulucf_sum); //
		output.put("waste_nm", waste_nm); //
		output.put("waste_val", waste_val); //
		output.put("waste_sum", waste_sum); //
		output.put("elect_nm", elect_nm); //
		output.put("elect_val", elect_val); //
		output.put("elect_sum", elect_sum); //
		output.put("indiwaste_nm", indiwaste_nm); //
		output.put("indiwaste_val", indiwaste_val); //
		output.put("indiwaste_sum", indiwaste_sum); //
		
		return output;
		
	}
	
	@RequestMapping("Low_data.do")
	@ResponseBody
	public Map<String, Object> low_data(@RequestParam(value="year" , required = false) Integer year){
		
		Integer[] year_date = { 2015, 2016, 2017, 2018, 2019, 2020 }; // 추후 db에서 값 가져오기
		Integer[] data_val_2 = new Integer[year_date.length]; // 직접배출
		Integer[] data_val_10 = new Integer[year_date.length]; // 간접배출
		
		for (int i = 0; i < year_date.length; i++) { // 년노별 초기화
			data_val_2[i] = 0;
			data_val_10[i] = 0;
		}

		List<CbntrdataDto> year_data = carbondataservice.SelectLowDatayear();
		//연간 직 간접 배출량 
		for (int i = 0; i < year_data.size(); i++) {
			for (int j = 0; j < year_date.length; j++) {
				if (year_data.get(i).getData_date().equals(year_date[j])) {
					if (year_data.get(i).getLev_2().equals("직접배출")) {
						data_val_2[j] += year_data.get(i).getData_val();
					} else if (year_data.get(i).getLev_2().equals("간접배출")) {
						data_val_10[j] += year_data.get(i).getData_val();
					}
				}
			}
		}
		
		Integer low_date = 2018;
		if(year == null) {
			low_date = 2018;
		}else {
			low_date = year;
		}
		
		List<CategoryDto> category =carbondataservice.categoryLownm(); //대분류 카테고리명 (에너지 산업공정 등)
		List<CategoryDto> catecount = carbondataservice.CategoryLowCount(); //카레고리별 총갯수(에너지 6개, 산업공정 1개 등)
		
		String[] cate_nm = new String[category.size()]; // 
		Integer[] cate_sn = new Integer[category.size()];
		Integer[] Low_arr = new Integer[category.size()]; // 큰 배열->연도->작은배열->대분류별 데이터 입력
		Integer max = catecount.get(0).getCount();
		
		for (int i = 0; i < catecount.size(); i++) {// 카테고리수 최대값 구하기
			max = Math.max(max, catecount.get(i).getCount());
		}
		
		Integer[][] Arr = new Integer[category.size()][max];
		for (int i = 0; i < category.size(); i++) {
			cate_nm[i] = category.get(i).getCate_nm(); // 대분류 카테고리 명
			cate_sn[i] = category.get(i).getCate_sn(); // 대분류 카테고리 idx
			Low_arr[i] = 0; // 각 대분류별 데이터 
			for(int j = 0; j < catecount.get(i).getCount(); j++) {
				Arr[i][j] = 0;
			}
		}
		
		String[] cata_name ={"에너지","농업","LULUCF","전력(간접)","폐기물(간접)"};
		List<CategoryDto> prdt_info_energy =carbondataservice.SelectLowPrdtnm(cata_name[0]); //배출인벤 에너지 활동자료명 가져옴
		log.info("prdt_info_energy= {}", prdt_info_energy);
		log.info("catecount= {}", catecount);
		/**/
		String[] energy_nm = new String[catecount.get(0).getCount()];
		Integer[] energy_sn = new Integer[catecount.get(0).getCount()];
		Integer[] energy_val = new Integer[catecount.get(0).getCount()];
		for(int i =0; i<prdt_info_energy.size(); i++) {
			energy_sn[i] = prdt_info_energy.get(i).getPrdt_sn();
			energy_nm[i] = prdt_info_energy.get(i).getPrdt_nm();
			energy_val[i] = 0;
		}
		/**/
		String[] agri_nm  = new String[catecount.get(1).getCount()];
		Integer[] agri_sn = new Integer[catecount.get(1).getCount()];
		Integer[] agri_val = new Integer[catecount.get(1).getCount()];
		List<CategoryDto> prdt_info_agri =carbondataservice.SelectLowPrdtnm(cata_name[1]); //배출인벤 에너지 활동자료명 가져옴
		for(int i =0; i<prdt_info_agri.size(); i++) {
			agri_sn[i] = prdt_info_agri.get(i).getPrdt_sn();
			agri_nm [i] = prdt_info_agri.get(i).getPrdt_nm();
			agri_val[i] = 0;
		}
		/**/
		String[] lulucf_nm  = new String[catecount.get(2).getCount()];
		Integer[] lulucf_sn = new Integer[catecount.get(2).getCount()];
		Integer[] lulucf_val = new Integer[catecount.get(2).getCount()];
		List<CategoryDto> prdt_info_lulucf =carbondataservice.SelectLowPrdtnm(cata_name[2]); //배출인벤 에너지 활동자료명 가져옴
		for(int i =0; i<prdt_info_lulucf.size(); i++) {
			lulucf_sn[i] = prdt_info_lulucf.get(i).getPrdt_sn();
			lulucf_nm [i] = prdt_info_lulucf.get(i).getPrdt_nm();
			lulucf_val[i] = 0;
		}
		/**/
		String[] elect_nm  = new String[catecount.get(3).getCount()];
		Integer[] elect_sn = new Integer[catecount.get(3).getCount()];
		Integer[] elect_val = new Integer[catecount.get(3).getCount()];
		List<CategoryDto> prdt_info_elect =carbondataservice.SelectLowPrdtnm(cata_name[3]); //배출인벤 에너지 활동자료명 가져옴
		for(int i =0; i<prdt_info_elect.size(); i++) {
			elect_sn[i] = prdt_info_elect.get(i).getPrdt_sn();
			elect_nm [i] = prdt_info_elect.get(i).getPrdt_nm();
			elect_val[i] = 0;
		}
		/**/
		String[] indiwaste_nm  = new String[catecount.get(4).getCount()];
		Integer[] indiwaste_sn = new Integer[catecount.get(4).getCount()];
		Integer[] indiwaste_val = new Integer[catecount.get(4).getCount()];
		List<CategoryDto> prdt_info_indiwaste =carbondataservice.SelectLowPrdtnm(cata_name[4]); //배출인벤 에너지 활동자료명 가져옴
		for(int i =0; i<prdt_info_indiwaste.size(); i++) {
			indiwaste_sn[i] = prdt_info_indiwaste.get(i).getPrdt_sn();
			indiwaste_nm [i] = prdt_info_indiwaste.get(i).getPrdt_nm();
			indiwaste_val[i] = 0;
		}
		
		Integer energy_sum = 0;
		Integer agri_sum = 0;
		Integer lulucf_sum = 0;
		Integer elect_sum = 0;
		Integer indiwaste_sum = 0;
		List<CbntrdataDto> data = carbondataservice.SelectLowData(low_date); //연별 배출량 데이터 조회
		log.info("datadatadata= {}", data);
		for(int i=0; i<data.size(); i++) {
			for(int a=0; a<energy_sn.length; a++) {
				if(data.get(i).getPrdt_sn().equals(energy_sn[a])) {energy_sum += data.get(i).getData_val();energy_val[a] = data.get(i).getData_val();}
			}
			for(int c=0; c<agri_sn.length; c++) {
				if(data.get(i).getPrdt_sn().equals(agri_sn[c])) {agri_sum += data.get(i).getData_val();agri_val[c] = data.get(i).getData_val();}
			}
			for(int d=0; d<lulucf_sn.length; d++) {
				if(data.get(i).getPrdt_sn().equals(lulucf_sn[d])) {lulucf_sum += data.get(i).getData_val();lulucf_val[d] = data.get(i).getData_val();}
			}
			for(int f=0; f<elect_sn.length; f++) {
				if(data.get(i).getPrdt_sn().equals(elect_sn[f])) {elect_sum += data.get(i).getData_val();elect_val[f] = data.get(i).getData_val();}
			}
			for(int g=0; g<indiwaste_sn.length; g++) {
				if(data.get(i).getPrdt_sn().equals(indiwaste_sn[g])) {indiwaste_sum += data.get(i).getData_val();indiwaste_val[g] = data.get(i).getData_val();}
			}
		}
		
		/* 총 배울량, 총 간접인벤, 직접배출량, 간접배출량 데이터 */
		for (int i = 0; i < category.size(); i++) {
			Low_arr[i] = 0; // 각 대분류별 데이터 
		}
		for (int i = 0; i < data.size(); i++) {
			for(int j =0; j<category.size(); j++) {
				if(data.get(i).getCate_sn_3().equals(cate_sn[j])) {
					Low_arr[j] += data.get(i).getData_val();
				}
			}
		}
		
		Integer total_val =0; //총 배출량 lulu 뺸거
		Integer total_lu_val =0; //순 배출량 lulu 더한더 
		Integer di_val =0; //직접 배출
		Integer indi_val =0; // 간접 배출
		
		List<CbntrdataDto> data4 = carbondataservice.SelectLowData(low_date);
		
		for(int i = 0; i<data4.size(); i++) {
			total_lu_val += data4.get(i).getData_val();
			if(!data4.get(i).getLev_3().equals("LULUCF")) {
				total_val += data4.get(i).getData_val();
				if(data4.get(i).getLev_2().equals("직접배출")) {
					di_val += data4.get(i).getData_val();
				}
				if(data4.get(i).getLev_2().equals("간접배출")) {
					indi_val += data4.get(i).getData_val();
				}
			}
			
		}

		Map<String, Object> output = new HashMap<>();

		output.put("cate_nm", cate_nm); // 배출인벤 활동자료 명
		output.put("Low_arr", Low_arr); // 각 대분류별 데이터
		
		output.put("year", low_date); //간접 배출
		
		//대분류 별 데이터
		output.put("energy_val", energy_val); //간접 배출
		// 감축 인벤 직접 간접 배출 데이터
		output.put("year_date", year_date); // 연도
		output.put("data_val_2", data_val_2); //직접 배출
		output.put("data_val_10", data_val_10); //간접 배출
		System.out.println(Arrays.toString(year_date));
		//선택 연도에 따른 값
		output.put("total_val", total_val); //총 배출량 lulu 뺸거
		output.put("total_lu_val", total_lu_val); //순 배출량 lulu 더한더
		output.put("di_val", di_val); //직접 배출
		output.put("indi_val", indi_val); //간접 배출
		output.put("year", low_date); //간접 배출
		
		//대분류 별 데이터
		output.put("energy_nm", energy_nm); //
		output.put("energy_val", energy_val); //
		output.put("energy_sum", energy_sum); //
		output.put("agri_nm", agri_nm); //
		output.put("agri_val", agri_val); //
		output.put("agri_sum", agri_sum); //
		output.put("lulucf_nm", lulucf_nm); //
		output.put("lulucf_val", lulucf_val); //
		output.put("lulucf_sum", lulucf_sum); //
		output.put("elect_nm", elect_nm); //
		output.put("elect_val", elect_val); //
		output.put("elect_sum", elect_sum); //
		output.put("indiwaste_nm", indiwaste_nm); //
		output.put("indiwaste_val", indiwaste_val); //
		output.put("indiwaste_sum", indiwaste_sum); //
		
		return output;
		
	}
	
}



