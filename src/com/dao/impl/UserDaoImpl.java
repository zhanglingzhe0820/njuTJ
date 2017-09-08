package com.dao.impl;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dao.UserDao;
import com.model.User;

@Repository(value = "userDao")
public class UserDaoImpl implements UserDao {

	@Autowired
	private SessionFactory sessionFactory;
	
	@SuppressWarnings("unchecked")
	@Override
	public User getUserByNumber(String number) {
		Session session=sessionFactory.openSession();
		List<Object> list;
		
		String hql="from User user where user.number=?";
		Query q=session.createQuery(hql);
		q.setParameter(0, number);
		list= q.list();
		session.close();
		if(list==null){
			return null;
		}
		else{
			return (User)list.get(0);
		}
	}

	@Override
	public void insertUser(String qq, String phone, String number, String department, String name) {
		Session session=sessionFactory.openSession();
		User user=new User();
		user.setQq(qq);
		user.setPhone(phone);
		user.setNumber(number);
		user.setDepartment(department);
		user.setName(name);
		session.save(user);
		session.close();
	}

}
