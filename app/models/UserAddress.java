package models;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import play.db.jpa.Model;

@Entity
@Table(name="back_useraddress")
public class UserAddress extends Model {

    @ManyToOne
    public UserDetail userDetail;

    public String address;
    public String phone;

}
