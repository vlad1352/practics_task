package com.boots.entity;

import javax.persistence.*;
import java.util.Set;

@Entity
@Table(name = "t_user_details")
public class UserDetails {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    private String name;
    private String surname;
    private int age;
    private String post;
    private String timeIn;
    private String timeOut;

    @OneToOne(mappedBy = "userDetails")
    private User user;

    @ManyToMany(fetch = FetchType.EAGER)
    private Set<Kpp> kpps;

    public UserDetails() {
    }

    public String getTimeIn() {
        return timeIn;
    }

    public void setTimeIn(String timeIn) {
        this.timeIn = timeIn;
    }

    public String getTimeOut() {
        return timeOut;
    }

    public void setTimeOut(String timeOut) {
        this.timeOut = timeOut;
    }

    public Set<Kpp> getKpps() {
        return kpps;
    }

    public void setKpps(Set<Kpp> kpps) {
        this.kpps = kpps;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSurname() {
        return surname;
    }

    public void setSurname(String surname) {
        this.surname = surname;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public String getPost() {
        return post;
    }

    public void setPost(String post) {
        this.post = post;
    }


}
