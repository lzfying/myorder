package controllers;

import java.util.List;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

import models.Order;
import models.User;
import models.UserAddress;
import models.UserDetail;
import play.mvc.Controller;
import play.mvc.With;

@Check("admin")
@With(Secure.class)
public class AdminUsers extends Controller {

    public static void adminUser() {
        render();
    }

    public static void getUsers(Integer page, Integer rows) {
    	int start = (page-1) * rows;
    	long count = 0;
    	List<User> userList = null;
    	if (page != null && rows != null) {
    		userList = User.find("order by id desc").from(start).fetch(rows);
    		count = User.count();
    	} else {
    		userList = User.find("order by id desc").from(start).fetch(rows);
    		count = User.count();
    	}
    	renderText(generateJson(userList, count));
    }
    
    public static void getUserInfo(Long id) {
    	User user = User.find("byId", id).first();
    	JsonObject obj = getUserJsonObj(user);
    	renderText(obj);
    }
    
    public static JsonObject generateJson(List<User> list, long count) {
    	JsonObject json = new JsonObject();
        json.addProperty("total", count);
        JsonArray array = new JsonArray();
        for(User user: list) {
            JsonObject obj = getUserJsonObj(user);
            array.add(obj);
        }
        json.add("rows", array);
        return json;
    }
    
    private static JsonObject getUserJsonObj(User user) {
    	JsonObject obj = new JsonObject();
    	obj.addProperty("id", user.id);
        obj.addProperty("username", user.username);
        obj.addProperty("email", user.email);
        if (user.userDetail != null) {
        	obj.addProperty("sex", user.userDetail.sex);
        	List<UserAddress> addrlist = user.userDetail.address;
        	
        	System.out.println(addrlist + "-----------" + addrlist.size());
        	
        	if (addrlist != null) {
        		StringBuffer sb = new StringBuffer();
        		for (int i=0;i<addrlist.size();i++) {
        			UserAddress addr  = addrlist.get(i);
        			String addrphone = addr.address +"    " + addr.phone;
        			sb.append(addrphone);
        			if (i != addrlist.size() - 1) {
        				sb.append("\n");
        			}
        		}
        		obj.addProperty("address", sb.toString());
        	}
        }
        return obj;
    }
    
    public static void saveUser(User user) {
    	user.save();
    }
    
    public static void deleteUser(Long[] id) {
    	for (int i=0;i<id.length;i++) {
    		User order = User.findById(id[i]);
    		order.delete();
    	}
    }
}