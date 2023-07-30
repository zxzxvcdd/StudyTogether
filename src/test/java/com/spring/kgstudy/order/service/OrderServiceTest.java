package com.spring.kgstudy.order.service;

import java.util.Date;

import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;
import org.springframework.test.context.web.WebAppConfiguration;

import com.spring.kgstudy.common.order.OrderState;
import com.spring.kgstudy.common.pass.PassState;
import com.spring.kgstudy.common.pass.PassType;
import com.spring.kgstudy.menu.vo.MenuVO;
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

		for (int i = 1; i <= 10; i++) {
			OrderVO order = new OrderVO();

			order.setImpUid("" + i + new Date());
			order.setOrderDate(new Date());
			order.setOrderName(i + "시간권");
			order.setOrderPrice(5000 * i);
			order.setOrderState(OrderState.PAID);
			order.setUserId("admin");
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

			OrderVO order = new OrderVO();

			order.setImpUid("" + i + new Date());
			order.setOrderDate(new Date());
			order.setOrderName(i + "일권");
			order.setOrderPrice(5000 * 18 * i);
			order.setOrderState(OrderState.PAID);
			order.setUserId("admin");
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
