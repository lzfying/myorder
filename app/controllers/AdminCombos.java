package controllers;

import java.util.List;

import models.Combo;
import models.ComboDetail;
import models.Meal;
import play.mvc.Controller;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

public class AdminCombos extends Controller {

	public static void adminCombo() {
		render();
	}

	public static void getCombos (Integer page, Integer rows) {
    	int start = (page-1) * rows;
    	long count = 0;
    	List<Combo> comboList = null;
    	if (page != null && rows != null) {
    		comboList = Combo.find("order by id desc").from(start).fetch(rows);
    		count = Combo.count();
    	} else {
    		comboList = Combo.find("order by id desc").from(start).fetch(rows);
    		count = Combo.count();
    	}
    	renderText(generateJson(comboList, count));
    }

	public static JsonObject generateJson(List<Combo> list, long count) {
    	JsonObject json = new JsonObject();
        json.addProperty("total", count);
        JsonArray array = new JsonArray();
        for(Combo combo: list) {
            JsonObject obj = getJsonObj(combo);
            array.add(obj);
        }
        json.add("rows", array);
        return json;
    }

	public static JsonObject getJsonObj(Combo combo) {
    	JsonObject obj = new JsonObject();
    	obj.addProperty("ck", combo.id);
    	obj.addProperty("id", combo.id);
        obj.addProperty("name", combo.name);
        obj.addProperty("price", combo.price.price);
        obj.addProperty("discount", combo.price.discount);
        obj.addProperty("des", combo.des);
        if (combo.details != null) {
        	String meals = "";
        	for (ComboDetail detail: combo.details) {
        		meals += detail.meal.name + "<br>";
        	}
        	obj.addProperty("meals", meals);
        }
        return obj;
    }
	
	public static void saveCombo(Combo combo, Long id[]) {
		combo.save();
		if (id.length > 0) {
//			Combo c = Combo.findById(combo.id);
			for (int i=0;i<id.length;i++) {
				Meal meal = Meal.findById(id[i]);
				if (meal != null) {
					ComboDetail detail = new ComboDetail();
					detail.meal = meal;
					detail.num = 1;
					detail.save();
					combo.addDetail(detail);
				}
			}
		}
	}
}
