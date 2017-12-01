package org.njuTJ.model.User;

import org.springframework.stereotype.Component;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "User")
public class User {
    @Id
    @Column(name = "number")
    private String number;
    @Column(name = "qq")
    private String qq;
    @Column(name = "phone")
    private String phone;
    @Column(name = "department")
    private String department;
    @Column(name = "name")
    private String name;
    @Column(name = "position")
    private String position;


    public User() {

    }

    public User(String qq, String phone, String number, String department, String name, String position) {
        this.qq = qq;
        this.phone = phone;
        this.number = number;
        this.department = department;
        this.name = name;
        this.position = position;
    }

    public String getQq() {
        return qq;
    }

    public void setQq(String qq) {
        this.qq = qq;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getNumber() {
        return number;
    }

    public void setNumber(String number) {
        this.number = number;
    }

    public String getDepartment() {
        return department;
    }

    public void setDepartment(String department) {
        this.department = department;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPosition() {
        return position;
    }

    public void setPosition(String position) {
        this.position = position;
    }
}
