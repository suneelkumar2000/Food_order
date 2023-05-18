package cys.food_order.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import cys.food_order.model.OrderItem;
import cys.food_order.util.ConnectionUtil;
import cys.food_order.validation.Validation;

public class OrderItemImpl implements OrderItemDAO {
	
	Validation val = new Validation();
	@Override
	public int insertOrder(OrderItem order) throws ClassNotFoundException, SQLException {
		// TODO Auto-generated method stub
		Connection con = ConnectionUtil.getConnection();
		String insert = "insert into Orderiteam(order_id) values(?)";
		PreparedStatement ps = con.prepareStatement(insert);
		
		boolean num = val.numberValidation(order.getId());
		
		if(num == true) {
		ps.setInt(1, order.getId());
		int execute = ps.executeUpdate();

		String find = "select food_id,quantity from orders where id=?";
		PreparedStatement ps1 = con.prepareStatement(find);
		ps1.setInt(1, order.getId());
		ResultSet rs = ps1.executeQuery();
		while (rs.next()) {
			int food = rs.getInt(1);
			int quantity =rs.getInt(2);
			String find1 = "select unit_price from fooditem where id=?";
			PreparedStatement ps2 = con.prepareStatement(find1);
			ps2.setInt(1,food);
			ResultSet rs1 = ps2.executeQuery();
			while (rs1.next()) {
				int price = rs1.getInt(1);
				String insert1 = "update Orderiteam set food_id=?,quantity=?,unit_price=? where order_id=?";
				PreparedStatement ps3 = con.prepareStatement(insert1);
				ps3.setInt(1,food);
				ps3.setInt(2,quantity);
				ps3.setInt(3,price);
				ps3.setInt(4, order.getId());
				ps3.executeUpdate();
				
			}
		}
		return execute;
		} else
			return 0;
	}

	@Override
	public int deleteOrder(int id) throws ClassNotFoundException, SQLException {
		// TODO Auto-generated method stub
		Connection con = ConnectionUtil.getConnection();
		String delete = "delete from Orderiteam where order_id=?";
		PreparedStatement ps = con.prepareStatement(delete);

		ps.setInt(1, id);

		int execute = ps.executeUpdate();
		return execute;
	}

	@Override
	public List<OrderItem> orderList() throws ClassNotFoundException, SQLException {
		// TODO Auto-generated method stub
		Connection con = ConnectionUtil.getConnection();
		String display = "select order_id,food_id,quantity,unit_price from Orderiteam";
		PreparedStatement ps = con.prepareStatement(display);
		ResultSet rs = ps.executeQuery();
		ArrayList orderList = new ArrayList<>();
		while (rs.next()) {
			int id = rs.getInt(1);
			int foodId = rs.getInt(2);
			int quantity = rs.getInt(3);
			int unitPrice = rs.getInt(4);
			OrderItem order = new OrderItem();
			order.setId(id);
			order.setFoodId(foodId);
			order.setQuantity(quantity);
			order.setUnitPrice(unitPrice);
			orderList.add(order);
		}
		return orderList;
	}

	@Override
	public int findByFoodId(int id) throws ClassNotFoundException, SQLException {
		// TODO Auto-generated method stub
		Connection con = ConnectionUtil.getConnection();
		String find = "select quantity from Orderiteam where order_id=?";
		PreparedStatement ps = con.prepareStatement(find);

		ps.setInt(1, id);
		ResultSet rs = ps.executeQuery();
		while (rs.next()) {
			int q = (rs.getInt(1));
			return q;
		}
		return 0;
	}

}
