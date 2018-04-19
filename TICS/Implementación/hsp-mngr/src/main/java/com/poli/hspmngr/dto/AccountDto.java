package com.poli.hspmngr.dto;

import javax.persistence.*;

@Entity(name = "user")
public class AccountDto {

    @Id
    @GeneratedValue
    @Column (name = "id")
    private int id;
    @Column (name = "areaId")
    private int areaId;
    @Column (name = "bloodId")
    private int bloodId;
    @Column (name = "username")
    private String username;
    @Column (name = "password")
    private String password;
    @Column (name = "name")
    private String name;
    @Column (name = "phone")
    private String phone;
    @Column (name = "role")
    private String role;
    @Column (name = "genre")
    private String genre;

    public AccountDto() {

    }

    public AccountDto(int areaId, int bloodId, String username, String password, String name, String phone, String role, String genre) {
        this.areaId = areaId;
        this.bloodId = bloodId;
        this.username = username;
        this.password = password;
        this.name = name;
        this.phone = phone;
        this.role = role;
        this.genre = genre;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getAreaId() {
        return areaId;
    }

    public void setAreaId(int areaId) {
        this.areaId = areaId;
    }

    public int getBloodId() {
        return bloodId;
    }

    public void setBloodId(int bloodId) {
        this.bloodId = bloodId;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public String getGenre() {
        return genre;
    }

    public void setGenre(String genre) {
        this.genre = genre;
    }
}
