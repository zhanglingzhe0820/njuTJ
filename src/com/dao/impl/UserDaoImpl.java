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
import com.model.EventTime;
import com.model.User;
import com.model.Whole;

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
		StringBuilder result=new StringBuilder();
		
		String hql="from Amount amount where amount.event=?";
		Query q=session.createQuery(hql);
		q.setParameter(0, event);
		list= q.list();
		session.close();
		int recentTime=((Amount) list.get(0)).getRecentTime();
		
		session=sessionFactory.openSession();
		hql="from Event ev where ev.event=? and ev.number=? and ev.time=?";
		q=session.createQuery(hql);
		q.setParameter(0, event);
		q.setParameter(1, number);
		q.setParameter(2, recentTime);
		list=q.list();
		if(list==null||list.isEmpty()){
			Event ev=new Event();
			ev.setEvent(event);
			ev.setNumber(number);
			ev.setTime(recentTime);
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
		StringBuilder result=new StringBuilder();
		
		String hql="from Amount amount where amount.event=?";
		Query q=session.createQuery(hql);
		q.setParameter(0, event);
		list= q.list();
		session.close();
		int recentTime=((Amount) list.get(0)).getRecentTime();
		
		session=sessionFactory.openSession();
		hql="delete Event ev where ev.event=? and ev.number=? and ev.time=?";
		q=session.createQuery(hql);
		q.setParameter(0, event);
		q.setParameter(1, number);
		q.setParameter(2, recentTime);
		int t=q.executeUpdate();
		q.executeUpdate();
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
		List<Object> listTime;
		StringBuilder result=new StringBuilder();
		
		String hql="from Amount";
		Query q=session.createQuery(hql);
		list= q.list();
		session.close();
		
		for(Object amount:list){
			session=sessionFactory.openSession();
			hql="from Event ev where ev.number=? and ev.time=? and ev.event=?";
			q=session.createQuery(hql);
			q.setParameter(0, number);
			q.setParameter(1, ((Amount) amount).getRecentTime());
			q.setParameter(2, ((Amount) amount).getEvent());
			listTime=q.list();
			session.close();

			if(listTime!=null&&!listTime.isEmpty()){
				result.append(((Amount) amount).getEvent());
				result.append("|");
			}
		}
		
		if(result.length()<=1){
			return "none";
		}
		else{
			return new String(result.substring(0,result.length()-1).toCharArray());
		}
	}

	@Override
	public String loadAmount() {
		Session session=sessionFactory.openSession();
		List<Object> list;
		List<Object> listTime;
		
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
				
				session=sessionFactory.openSession();
				hql="from EventTime et where et.event=? and et.time=?";
				q=session.createQuery(hql);
				q.setParameter(0, ((Amount)eva).getEvent());
				q.setParameter(1, ((Amount)eva).getRecentTime());
				listTime=q.list();
				session.close();
				if(listTime==null||listTime.isEmpty()){
					result.append(0);
				}
				else{
					result.append(((EventTime)(listTime.get(0))).getNum());
				}
				result.append("|");
				
				result.append(((Amount)eva).getCanRegister());
				result.append("|");
				
				result.append(((Amount)eva).getRealName());
				result.append("|");
				
				result.append(((Amount)eva).getRecentTime());
				result.append("|");
			}
			return new String(result.substring(0,result.length()-1).toCharArray());
		}
	}
	
	public String loadArrange(){
		Session session=sessionFactory.openSession();
		List<Object> list;
		List<Object> listUser;
		List<Object> listName;
		
		String hql="from Event ev order by ev.event,ev.time asc";
		Query q=session.createQuery(hql);
		list= q.list();
		session.close();
		
		StringBuilder result=new StringBuilder();
		if(list==null||list.isEmpty()){
			return "none";
		}
		else{
			for(Object ev:list){
				result.append(((Event)ev).getEvent());
				result.append("|");
				
				result.append(((Event)ev).getTime());
				result.append("|");
				
				session=sessionFactory.openSession();
				hql="from User user where user.number=?";
				q=session.createQuery(hql);
				q.setParameter(0, ((Event)ev).getNumber());
				listUser=q.list();
				session.close();
				
				result.append(((User)listUser.get(0)).getName());
				result.append("|");
				
				result.append(((User)listUser.get(0)).getNumber());
				result.append("|");
				
				result.append(((User)listUser.get(0)).getQq());
				result.append("|");
				
				result.append(((User)listUser.get(0)).getPhone());
				result.append("|");
				
				result.append(((User)listUser.get(0)).getDepartment());
				result.append("|");
				
				result.append(((Event)ev).getTimeLength());
				result.append("|");
				
				session=sessionFactory.openSession();
				hql="from Amount am where am.event=?";
				q=session.createQuery(hql);
				q.setParameter(0, ((Event)ev).getEvent());
				listName=q.list();
				session.close();
				result.append(((Amount)listName.get(0)).getRealName());
				result.append("|");
			}
			return new String(result.substring(0,result.length()-1).toCharArray());
		}
	}
	
	private void eventP1(String event){
		Session session=sessionFactory.openSession();
		List<Object> list;
		int recentTime;
		
		String hql="from Amount eva where eva.event=?";
		Query q=session.createQuery(hql);
		q.setParameter(0, event);
		list= q.list();
		recentTime=((Amount)list.get(0)).getRecentTime();
		hql="from EventTime et where et.event=? and et.time=?";
		q=session.createQuery(hql);
		q.setParameter(0, event);
		q.setParameter(1, recentTime);
		list=q.list();
		int toUpdate=((EventTime) list.get(0)).getNum()+1;
		hql="update EventTime et set et.num=? where et.event=? and et.time=?";
		q=session.createQuery(hql);
		q.setParameter(0, toUpdate);
		q.setParameter(1, event);
		q.setParameter(2, recentTime);
		q.executeUpdate();
		session.close();
	}
	
	private void eventM1(String event){
		Session session=sessionFactory.openSession();
		List<Object> list;
		int recentTime;
		
		String hql="from Amount eva where eva.event=?";
		Query q=session.createQuery(hql);
		q.setParameter(0, event);
		list= q.list();
		recentTime=((Amount)list.get(0)).getRecentTime();
		hql="from EventTime et where et.event=? and et.time=?";
		q=session.createQuery(hql);
		q.setParameter(0, event);
		q.setParameter(1, recentTime);
		list=q.list();
		int toUpdate=((EventTime) list.get(0)).getNum()-1;
		hql="update EventTime et set et.num=? where et.event=? and et.time=?";
		q=session.createQuery(hql);
		q.setParameter(0, toUpdate);
		q.setParameter(1, event);
		q.setParameter(2, recentTime);
		q.executeUpdate();
		session.close();
	}

	@Override
	public boolean startRegister(String recentTime,String event) {
		Session session=sessionFactory.openSession();
		
		String hql="";
		Query q;
		
		hql="from EventTime et where et.event=? and et.time=?";
		q=session.createQuery(hql);
		q.setParameter(0, event);
		q.setParameter(1, Integer.parseInt(recentTime));
		List<Object> tempList=q.list();
		
		if(tempList==null|tempList.isEmpty()){
			EventTime et=new EventTime();
			et.setEvent(event);
			et.setTime(Integer.parseInt(recentTime));
			et.setNum(0);
			session.save(et);
			session.close();
		}
		
		session=sessionFactory.openSession();
		hql="update Amount eva set eva.canRegister=?,eva.recentTime=? where eva.event=?";
		q=session.createQuery(hql);
		q.setParameter(0, 1);
		q.setParameter(1, Integer.parseInt(recentTime));
		q.setParameter(2, event);
		q.executeUpdate();
		session.close();
		return true;
	}

	@Override
	public boolean stopRegister(String recentTime,String event) {
		Session session=sessionFactory.openSession();
		
		String hql="update Amount eva set eva.canRegister=?,eva.recentTime=? where eva.event=?";
		Query q=session.createQuery(hql);
		q.setParameter(0, 0);
		q.setParameter(1, Integer.parseInt(recentTime));
		q.setParameter(2, event);
		q.executeUpdate();
		session.close();
		return true;
	}

	@Override
	public String submitLength(String lengthMessages) {
		Session session=sessionFactory.openSession();
		String hql="update Event ev set ev.timeLength=? where ev.event=? and ev.time=? and ev.number=?";
		Query q=session.createQuery(hql);
		String[] messages=lengthMessages.split("\\|");
		try{
			for(int i=0;i<messages.length;i+=4){
				q.setParameter(0, Float.parseFloat(messages[i+3]));
				q.setParameter(1, messages[i]);
				q.setParameter(2, Integer.parseInt(messages[i+1]));
				q.setParameter(3, messages[i+2]);
				q.executeUpdate();
			}
			return "success";
		}catch(Exception e){
			e.printStackTrace();
			return "fail";
		}finally{
			session.close();
		}
	}

	@Override
	public void addEvent(String realName, String event, String recentTime) {
		Session session=sessionFactory.openSession();
		Amount amount=new Amount();
		amount.setCanRegister(0);
		amount.setEvent(event);
		amount.setRealName(realName);
		amount.setRecentTime(Integer.parseInt(recentTime));
		session.save(amount);
		session.close();
	}

	@Override
	public String loadDescribe(String event) {
		Session session=sessionFactory.openSession();
		List<Object> list;
		
		String hql="from Amount where event=?";
		Query q=session.createQuery(hql);
		q.setParameter(0, event);
		list= q.list();
		session.close();
		
		return ((Amount)list.get(0)).getRealName()+"|"+((Amount)list.get(0)).getInfo();
	}

	@Override
	public String updateDescribe(String info) {
		Session session=sessionFactory.openSession();
		
		String event=info.split(":")[0];
		String infos=info.split(":")[1];
		
		try{
			String hql="update Amount set info=? where event=?";
			Query q=session.createQuery(hql);
			q.setParameter(0, infos);
			q.setParameter(1, event);
			q.executeUpdate();
			return "success";
		}catch(Exception ex){
			ex.printStackTrace();
			return "fail";
		}finally{
			session.close();
		}
	}

	@Override
	public String updateWholeInfo(String kind, String content) {
		Session session=sessionFactory.openSession();
		List<Object> list;
		
		try{
			String hql="from Whole where kind=?";
			Query q=session.createQuery(hql);
			q.setParameter(0, kind);
			list= q.list();
			if(list==null||list.isEmpty()){
				Whole wholeInfo=new Whole();
				wholeInfo.setKind(kind);
				wholeInfo.setContent(content);
				session.save(wholeInfo);
			}
			else{
				hql="update Whole set content=? where kind=?";
				q=session.createQuery(hql);
				q.setParameter(0, content);
				q.setParameter(1, kind);
				q.executeUpdate();
			}
			return "success";
		}catch(Exception ex){
			ex.printStackTrace();
			return "fail";
		}finally{
			session.close();
		}
	}

	@Override
	public String loadWholeInfo(String kind) {
		Session session=sessionFactory.openSession();
		List<Object> list;
		
		try{
			String hql="from Whole where kind=?";
			Query q=session.createQuery(hql);
			q.setParameter(0, kind);
			list= q.list();
			return ((Whole)(list.get(0))).getContent();
		}catch(Exception ex){
			return "fail";
		}finally{
			session.close();
		}
		
	}

}
