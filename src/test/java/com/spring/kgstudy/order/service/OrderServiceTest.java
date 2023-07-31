package com.spring.kgstudy.order.service;

import java.time.LocalDate;
import java.time.ZoneId;
import java.util.Date;
import java.util.Random;
import java.util.UUID;

import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;
import org.springframework.test.context.web.WebAppConfiguration;

import com.spring.kgstudy.common.order.OrderState;
import com.spring.kgstudy.common.pass.PassState;
import com.spring.kgstudy.common.pass.PassType;
import com.spring.kgstudy.order.dao.OrderDAO;
import com.spring.kgstudy.order.vo.OrderVO;
import com.spring.kgstudy.order.vo.PassVO;

@WebAppConfiguration
@ExtendWith(SpringExtension.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/appServlet/*.xml",
		"file:src/main/webapp/WEB-INF/spring/root-context.xml" })
class OrderServiceTest {

	@Autowired
	OrderService service;
	@Autowired
	OrderDAO orderDAO;

	@Test
	public void insertPass() {

		
		LocalDate now = LocalDate.now();
		
		LocalDate start = now.minusYears(40);
		

		
		
		
		for (int j = 22; j <= 200; j++) {
			
			String userId= "user"+j;
			
			for (int i = 1; i <= 10; i++) {
				
				 Random random = new Random();
				 Long ranDay = (long) (random.nextInt((int) (now.toEpochDay() -start.toEpochDay()+1)) + start.toEpochDay());
				 
				 Date orderDate = 	Date.from(LocalDate.ofEpochDay(ranDay).atStartOfDay(ZoneId.systemDefault()).toInstant());
				  UUID one = UUID.randomUUID();
					
				
				OrderVO order = new OrderVO();

				order.setImpUid("" + i + one);
				order.setOrderDate(orderDate);
				order.setOrderName(i + "시간권");
				order.setOrderPrice(5000 * i);
				order.setOrderState(OrderState.PAID);
				order.setUserId(userId);
				orderDAO.insertOrder(order);

				int orderId = order.getOrderId();

				PassVO pass = new PassVO();

				pass.setOrderId(orderId);
				pass.setPassPrice(order.getOrderPrice());
				pass.setPassName(order.getOrderName());
				pass.setUserId(order.getUserId());
				pass.setPassState(PassState.DEACTIVE);
				pass.setPassType(PassType.TIME);
				pass.setPassTime(60 * 60 * i);
				pass.setMenuId(i);

				orderDAO.insertPass(pass);

			}

			for (int i = 1; i <= 10; i++) {

				 Random random = new Random();
				 Long ranDay = (long) (random.nextInt((int) (now.toEpochDay() -start.toEpochDay()+1)) + start.toEpochDay());
				 
				 Date orderDate = 	Date.from(LocalDate.ofEpochDay(ranDay).atStartOfDay(ZoneId.systemDefault()).toInstant());
				  UUID one = UUID.randomUUID();
				
				OrderVO order = new OrderVO();

				order.setImpUid("" + i +one);
				order.setOrderDate(orderDate);
				order.setOrderName(i + "일권");
				order.setOrderPrice(5000 * 18 * i);
				order.setOrderState(OrderState.PAID);
				order.setUserId(userId);
				orderDAO.insertOrder(order);

				int orderId = order.getOrderId();

				PassVO pass = new PassVO();

				pass.setOrderId(orderId);
				pass.setPassPrice(order.getOrderPrice());
				pass.setPassName(order.getOrderName());
				pass.setUserId(order.getUserId());
				pass.setPassState(PassState.DEACTIVE);
				pass.setPassType(PassType.SEASON);
				pass.setPassTime(60 * 60 * 24 * i);
				pass.setMenuId(i + 10);

				orderDAO.insertPass(pass);

			}

		}
	}
}
