package org.njuTJ.vo.user;


import org.njuTJ.entity.User.User;

public class UserVo {
    private String number;
    private String qq;
    private String phone;
    private String department;
    private String name;
    private String position;
    private String password;

    public UserVo(String number, String qq, String phone, String department, String name, String position, String password) {
        this.number = number;
        this.qq = qq;
        this.phone = phone;
        this.department = department;
        this.name = name;
        this.position = position;
        this.password = password;
    }

    public String getNumber() {
        return number;
    }

    public void setNumber(String number) {
        this.number = number;
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

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}
