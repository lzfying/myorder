package controllers;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.logging.SimpleFormatter;

import models.Order;
import play.data.binding.As;
import play.mvc.Controller;
import play.mvc.With;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

@Check("admin")
@With(Secure.class)
public class AdminOrders extends Controller {
    
    public static void adminOrder() {
        render();
    }

    public static void getOrders(Integer page, Integer rows, String startdate, String enddate) throws ParseException {
    	int start = (page-1) * rows;
    	List<Order> orderList;
    	long count = 0;
    	if (startdate !=null && enddate != null) {
    		SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
    		Date sDate = sf.parse(startdate);
    		Date eDate = sf.parse(enddate);
    		orderList = Order.find("date >= ? and date <= ? order by date desc",sDate, eDate).from(start).fetch(rows);
    		count = orderList.size();
    	} else {
    		orderList = Order.find("order by date desc").from(start).fetch(rows);
    		count = Order.count();
    	}
        
        renderText(generateJson(orderList, count));
    }

    public static void editOrderDetail(long id) {
        Order order = Order.findById(Long.valueOf(id));
        render(order);
    }

    public static JsonObject generateJson(List<Order> list, long count) {
        JsonObject json = new JsonObject();
        json.addProperty("total", count);
        JsonArray array = new JsonArray();
        for(Order order: list) {
            JsonObject obj = getOrderJsonObj(order);
            array.add(obj);
        }
        json.add("rows", array);
        return json;
    }
    
    public static void getOrderInfo(Long id) {
    	Order order = Order.find("byOrderNum", id).first();
    	JsonObject obj = getOrderJsonObj(order);
    	renderText(obj);
    }
    
    private static JsonObject getOrderJsonObj(Order order) {
    	JsonObject obj = new JsonObject();
        obj.addProperty("orderid", order.id);
        obj.addProperty("ordernum", order.orderNum);
        if (order.date != null) {
        	obj.addProperty("date", order.date.toLocaleString());
        }
        obj.addProperty("orderprice", order.orderPrice);
        obj.addProperty("state", order.orderstate);
        obj.addProperty("address", order.receiver_addr);
        obj.addProperty("tel", order.receiver_tel);
        obj.addProperty("name", order.receiver_name);
        obj.addProperty("others", order.receiver_other);
        return obj;
    }
    
    public static void saveOrder(Order order) {
    	order.save();
    }

    public static void deleteOrder(Long[] id) {
    	for (int i=0;i<id.length;i++) {
    		Order order = Order.findById(id[i]);
    		order.delete();
    	}
    }

    public static void updateOrder(Order data) {
    	Order order = Order.find("byOrderNum", data.orderNum).first();
    	order.save();
    }

    private static SimpleDateFormat sPiddatesf = new SimpleDateFormat("yyMMddHHmmss");
    private static SimpleDateFormat sOrdersf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

    public static void getOrderPaymentId() {
    	Date now = new Date();
    	String pdate = sPiddatesf.format(now);
    	String odate = sOrdersf.format(now);
    	int r1=(int)(Math.random()*(10));//产生3个0-9的随机数
    	int r2=(int)(Math.random()*(10));
    	int r3=(int)(Math.random()*(10));
    	String paymentID =new StringBuffer(pdate).append(r1).append(r2).append(r3).toString();// 订单ID
    	JsonObject obj = new JsonObject();
    	obj.addProperty("paymentid", paymentID);
    	obj.addProperty("date", odate);
    	renderText(obj);
    }
}
