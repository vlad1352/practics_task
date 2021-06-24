package com.boots.entity;

import javax.persistence.*;
import java.util.Set;

@Entity
@Table(name = "t_kpp")
public class Kpp {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    private String name;
    @ManyToMany(mappedBy = "kpps")
    private Set<UserDetails> users;

    public Kpp() {
    }

    public Set<UserDetails> getUsers() {
        return users;
    }

    public void setUsers(Set<UserDetails> users) {
        this.users = users;
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
}
