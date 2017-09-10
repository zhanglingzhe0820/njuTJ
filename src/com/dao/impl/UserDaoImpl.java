package com.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Repository;

import com.dao.UserDao;
import com.model.Amount;
import com.model.Event;
import com.model.User;

@Repository(value = "userDao")
public class UserDaoImpl implements UserDao {

	ApplicationContext context = new ClassPathXmlApplicationContext("classpath:applicationContext.xml");
	SessionFactory sessionFactory=(SessionFactory) context.getBean("sessionFactory");
	
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
		if(list==null||list.isEmpty()){
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

	@SuppressWarnings("unchecked")
	@Override
	public boolean register(String event, String number) {
		Session session=sessionFactory.openSession();
		List<Object> list;
		
		String hql="from Event ev where ev.event=? and ev.number=?";
		Query q=session.createQuery(hql);
		q.setParameter(0, event);
		q.setParameter(1, number);
		list=q.list();
		if(list==null||list.isEmpty()){
			Event ev=new Event();
			ev.setEvent(event);
			ev.setNumber(number);
			session.save(ev);
			session.close();
			eventP1(event);
			return true;
		}
		session.close();
		return false;
	}

	@Override
	public boolean drop(String event, String number) {
		Session session=sessionFactory.openSession();
		List<Object> list;
		
		String hql="delete Event ev where ev.event=? and ev.number=?";
		Query q=session.createQuery(hql);
		q.setParameter(0, event);
		q.setParameter(1, number);
		int t=q.executeUpdate();
		System.out.println(q.executeUpdate());
		if(t>0){
			session.close();
			eventM1(event);
			return true;
		}
		session.close();
		return false;
	}

	@Override
	public String load(String number) {
		Session session=sessionFactory.openSession();
		List<Object> list;
		
		String hql="from Event ev where ev.number=?";
		Query q=session.createQuery(hql);
		q.setParameter(0, number);
		list=q.list();
		session.close();
		if(list==null||list.isEmpty()){
			return "none";
		}
		else{
			StringBuilder result=new StringBuilder();
			for(Object ev:list){
				result.append(((Event)ev).getEvent());
				result.append("|");
			}
			return new String(result.substring(0,result.length()-1).toCharArray());
		}
	}

	@Override
	public String loadAmount() {
		Session session=sessionFactory.openSession();
		List<Object> list;
		
		String hql="from Amount";
		Query q=session.createQuery(hql);
		list= q.list();
		session.close();
		
		StringBuilder result=new StringBuilder();
		if(list==null||list.isEmpty()){
			return "none";
		}
		else{
			for(Object eva:list){
				result.append(((Amount)eva).getEvent());
				result.append("|");
				result.append(((Amount)eva).getAmount());
				result.append("|");
			}
			return new String(result.substring(0,result.length()-1).toCharArray());
		}
	}
	
	private void eventP1(String event){
		Session session=sessionFactory.openSession();
		List<Object> list;
		
		String hql="from Amount eva where eva.event=?";
		Query q=session.createQuery(hql);
		q.setParameter(0, event);
		list= q.list();
		int toUpdate=((Amount) list.get(0)).getAmount()+1;
		hql="update Amount eva set eva.amount=? where eva.event=?";
		q=session.createQuery(hql);
		q.setParameter(0, toUpdate);
		q.setParameter(1, event);
		q.executeUpdate();
		session.close();
	}
	
	private void eventM1(String event){
		Session session=sessionFactory.openSession();
		List<Object> list;
		
		String hql="from Amount eva where eva.event=?";
		Query q=session.createQuery(hql);
		q.setParameter(0, event);
		list= q.list();
		int toUpdate=((Amount) list.get(0)).getAmount()-1;
		hql="update Amount eva set eva.amount=? where eva.event=?";
		q=session.createQuery(hql);
		q.setParameter(0, toUpdate);
		q.setParameter(1, event);
		q.executeUpdate();
		session.close();
	}

}
