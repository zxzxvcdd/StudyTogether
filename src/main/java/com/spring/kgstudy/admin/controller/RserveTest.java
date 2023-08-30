package com.spring.kgstudy.admin.controller;

import org.rosuda.REngine.*;
import org.rosuda.REngine.Rserve.*;

public class RserveTest {
	public static void main(String[] args) throws REXPMismatchException {
		try {

			RConnection c = new RConnection(); // Rserve에 연결

			String vector = "c(1,2,3,4)";
			c.eval("meanVal=mean(" + vector + ")");
			double mean = c.eval("meanVal").asDouble();
			System.out.println("The mean of given vector is=" + mean);

		} catch (RserveException e) {
			e.printStackTrace();
		}
	}
}
