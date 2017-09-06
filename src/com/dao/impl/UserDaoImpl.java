package com.dao.impl;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Criteria;
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
	public User getUserByName(String name) {
		Session session=sessionFactory.getCurrentSession();
		List<User> list=new ArrayList<User>();
		
		Criteria criteria=session.createCriteria(User.class);
		if(null!=name||!"".equals(name)){
			criteria.add(Restrictions.eq("name",name));
		}
		list=criteria.list();
		
		if(list!=null&&list.size()>0){
			return list.get(0);
		}
		return null;
	}

}
