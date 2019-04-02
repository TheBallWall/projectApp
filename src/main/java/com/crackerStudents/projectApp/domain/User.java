package com.crackerStudents.projectApp.domain;

import lombok.Data;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "user", schema = "public")
@Data
public class User {
    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int id = 0;


    @Basic
    @Column(name = "first_name")
    private String firstName;

    @Basic
    @Column(name = "last_name")
    private String lastName;

    @Basic
    @Column(name = "email")
    private String email;

    @Basic
    @Column(name = "password")
    private String password;

    @Basic
    @Column(name = "login")
    private String login;

    @ManyToMany
    @JoinTable(name = "user_packs",
            joinColumns = {@JoinColumn(name = "user_id")},
            inverseJoinColumns = {@JoinColumn(name = "pack_id")})
    private List<Pack> packs = new ArrayList<>();

    @ManyToMany
    @JoinTable(name = "user_session",
            joinColumns = {@JoinColumn(name = "user_id")},
            inverseJoinColumns = {@JoinColumn(name = "session_id")})
    private List<Session> users = new ArrayList<>();
    //@ManyToMany
    //private List<Session> sessions = new ArrayList<>();

   // @ManyToMany
    //private List<Pack> packs = new ArrayList<>();
}

