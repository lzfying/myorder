package models;

import java.util.Date;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import play.data.validation.Required;
import play.db.jpa.Model;
@Entity
@Table(name="back_order")
public class Order extends Model{
	
	@Required
	public String orderNum;
	
	
	@Required
	@ManyToOne
	public User User;
	
	@Required
	@ManyToMany(cascade=CascadeType.PERSIST)
	public Set<OrderDetail> orderDetails;
	
	public Date date;
	
	public String receiver_name;
	
	public String receiver_addr;
	
	public String receiver_tel;
	
	public String receiver_other;
	
	public String payWay;
	
	public String orderstate;
	
	public int orderPrice;
	
	
	public void addOrderDetail(long mealId){
		
		
		
		
	}
	

	

}
