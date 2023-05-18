package cys.food_order.dao;

import java.sql.SQLException;
import java.util.List;

import cys.food_order.model.OrderItem;

public interface OrderItemDAO {
	public int insertOrder(OrderItem order) throws ClassNotFoundException, SQLException;
	public int deleteOrder(int id) throws ClassNotFoundException, SQLException;
	public List<OrderItem> orderList() throws ClassNotFoundException, SQLException;
	public int findByFoodId(int id) throws ClassNotFoundException, SQLException;
}
