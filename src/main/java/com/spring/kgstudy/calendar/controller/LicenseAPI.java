package com.spring.kgstudy.calendar.controller;

import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URI;
import java.net.URL;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.JsonObject;

import java.io.BufferedReader;
import java.io.IOException;

public class LicenseAPI {
	
	/* public static Map<String, Object> ApplicantInfoApi() throws IOException { */
		
		public static void main(String[] args) throws IOException {
		
		/*
		 * Map<String, Object> resultMap = new HashMap<>();
		 * 
		 * try {
		 */
			StringBuilder urlBuilder = new StringBuilder("http://openapi.q-net.or.kr/api/service/rest/InquiryStatSVC/getTotExamList"); /*URL*/
	        urlBuilder.append("?" + URLEncoder.encode("serviceKey","UTF-8") + "=K8DyeqFrUL9OJr0k2DT84Q2h2A7BM854AR/myvPwx4vVlqiDLVyRPDudvbI/jJ2BGihdS7kdqgCZfJXYScpVBw=="); /*Service Key*/
	        urlBuilder.append("&" + URLEncoder.encode("baseYY","UTF-8") + "=" + URLEncoder.encode("2017", "UTF-8")); /*기준년도*/
//	        urlBuilder.append("&" + URLEncoder.encode("pilrccnt1","UTF-8") + "=" + URLEncoder.encode("201015", "UTF-8")); /*기준년도 필기응시자수 합계*/
//	        urlBuilder.append("&" + URLEncoder.encode("pilpscnt1","UTF-8") + "=" + URLEncoder.encode("201015", "UTF-8")); /*기준년도 필기합격자수 합계*/
//	        urlBuilder.append("&" + URLEncoder.encode("silrccnt1","UTF-8") + "=" + URLEncoder.encode("201015", "UTF-8")); /*기준년도 실기응시자수 합계*/
//	        urlBuilder.append("&" + URLEncoder.encode("silpacnt1","UTF-8") + "=" + URLEncoder.encode("21101", "UTF-8")); /*기준년도 실기합격자수 합계*/
	        
	        URL url = new URL(urlBuilder.toString());
	        
	        //URI uri = new URI(url);
	        //String jsonString = restTemplate.getForObject(uri, String.class);
	        
	        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	        conn.setRequestMethod("GET");
	        conn.setRequestProperty("Content-type", "application/json");
	        System.out.println("Response code: " + conn.getResponseCode());
	        BufferedReader rd;
	        if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
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
	        System.out.println(sb.toString());
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
		/*} catch (Exception e){
	        e.printStackTrace();
	        resultMap.clear();
	        resultMap.put("Result", "0001");
	    }
        
        return resultMap;*/
        
    }
	
	
	
	
}
