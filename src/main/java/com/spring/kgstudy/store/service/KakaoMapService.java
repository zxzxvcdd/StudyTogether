package com.spring.kgstudy.store.service;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.spring.kgstudy.store.VO.StoreVO;

import lombok.RequiredArgsConstructor;


@Service
@RequiredArgsConstructor
public class KakaoMapService {

	
	
	private final String uri = "https://dapi.kakao.com/v2/local/search/keyword.json?size=15&category_group_code=CE7";
	private final String apiKey = "KakaoAK 4811118d83cc4f11769af7407cf75b6e";
	
	
	

	//얻어온 정보 db에 저장
	public List<StoreVO> saveMap() {

		JsonArray jsonMapList = new JsonArray();
		double jumpX = 0.5;
		double jumpY = 0.5;

		double startX = 126;

		Map<Integer,StoreVO> distinctMap= new HashMap<Integer,StoreVO>();
		for (int i = 0; i < 10; i++) {

			double endX = startX + jumpX;
			double startY = 33;

			for (int j = 0; j < 13; j++) {
				double endY = startY + jumpY;

				jsonMapList.addAll(getStoreList(startX, startY, endX, endY));
				startY = endY;

			}
			startX = endX;

		}

		if (jsonMapList != null) {

			for (int i = 0; i < jsonMapList.size(); i++) {
				
				JsonObject map = (JsonObject) jsonMapList.get(i);
				

				String storeAddres = map.get("address_name").getAsString();
				String storeName = map.get("place_name").getAsString();
				String storeTel = map.get("phone").getAsString();
				String storeRoadAddres = map.get("road_address_name").getAsString();
				Double storeLat = map.get("x").getAsDouble();
				Double storeLng = map.get("y").getAsDouble();
				
				if(storeName.length()>6) {
				storeName = "스터디투게더" + storeName.substring(6);
				
				}else {
					
					storeName = "스터디투게더 " + storeName;
					
					
				}
				
				int kakaoMapId = map.get("id").getAsInt();
				
				StoreVO vo = new StoreVO();
				
				vo.setStoreAddress(storeAddres);
				vo.setStoreName(storeName);
				vo.setStoreTel(storeTel);
				vo.setStoreRoadAddress(storeRoadAddres);
				vo.setStoreLat(storeLat);
				vo.setStoreLng(storeLng);
				
				
				
				
				distinctMap.put(kakaoMapId, vo);
				
				System.out.println(vo);

			}
			

			List<StoreVO> resultList  = new ArrayList<StoreVO>(distinctMap.values());

			System.out.println("검색 결과 : "+resultList.size());
	
			
			return resultList;
			
	
			
			
			
			
			
		}
		return null;

	}
	
//	public void test() {
//		
//		StoreVO vo = new StoreVO("서울 마포구 동교동 164-22","CE7","카페","음식점 > 카페 > 커피전문점 > 메가MGC커피",
//				1969925488,"메가MGC커피 홍대입구역점","http://place.map.kakao.com/1969925488"
//				,"02-323-0650","서울 마포구 홍익로6길 48",126.9242387367584,37.55619709509767);
//	
//		dao.insertMapList(vo);
//		
//		
//		
//	}
	
	//api를 통해 매장 검색
	public JsonArray getStoreList(double startX, double startY, double endX, double endY) {
		
		
		int page = 1;

		double offset = 0.01;

		JsonArray mapList = new JsonArray();

		while (true) {
			try {
				String query = URLEncoder.encode("투썸플레이스","UTF-8");

				StringBuilder reqUri = new StringBuilder(uri);
				reqUri.append("&query="+query).append("&page=" + page).append("&rect=" + (startX - offset)).append(",").append(startY - offset)
						.append(",").append(endX + offset).append(",").append(endY + offset);

				
				URL url = new URL(reqUri.toString());

				
				HttpURLConnection conn = (HttpURLConnection) url.openConnection();

				conn.setRequestMethod("GET");
				conn.setConnectTimeout(5000);
				conn.setReadTimeout(5000);
				conn.setRequestProperty("Authorization", apiKey);
				conn.setRequestProperty("Content-type", "application/json; charset=utf-8");

				

				try (BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()))) {

					String responseData = br.readLine();

					JsonElement element = JsonParser.parseString(responseData);


					JsonObject object = element.getAsJsonObject();
					JsonObject meta = object.get("meta").getAsJsonObject();
					JsonArray documents = object.get("documents").getAsJsonArray();

					int searchCnt = meta.get("total_count").getAsInt();

					if (searchCnt > 45) {

						double halfX = (startX + endX) / 2;
						double halfY = (startY + endY) / 2;

						mapList.addAll(getStoreList(startX, startY, halfX, halfY));
						mapList.addAll(getStoreList(halfX, startY, endX, halfY));
						mapList.addAll(getStoreList(startX, halfY, halfX, endY));
						mapList.addAll(getStoreList(halfX, halfY, endX, endY));

						return mapList;

					} else if (meta.get("is_end").getAsBoolean()) {
						mapList.addAll(documents);
						return mapList;
					} else {
						page += 1;
						mapList.addAll(documents);

					}

				} catch (Exception e) {
					e.printStackTrace();
				}

			} catch (Exception e) {
				e.printStackTrace();
			}

		}


	}


	
	
	
}
