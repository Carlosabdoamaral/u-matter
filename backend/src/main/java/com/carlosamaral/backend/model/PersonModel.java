package com.carlosamaral.backend.model;

import org.springframework.boot.context.properties.bind.DefaultValue;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import java.util.Date;
import java.util.List;

@Entity(name = "person")
public class PersonModel {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long person_id;

    @OneToMany(mappedBy = "post_id")
    private List<PostModel> posts;

    @ManyToOne
    private PlataformModel plataform;

    @NotNull
    private String uuid;

    @NotNull
    private Boolean deletedAccount;

    @NotNull
    private Boolean blockedAccount = false;

    @NotNull
    private Double lastBlockTime = 0.0;

    @NotNull
    private Date startDate;

    @NotNull
    private Double reactions = 0.0;

    public List<PostModel> getPosts() {
        return posts;
    }
    public void setPosts(List<PostModel> posts) {
        this.posts = posts;
    }
    public String getUuid() {
        return uuid;
    }
    public void setUuid(String uuid) {
        this.uuid = uuid;
    }
    public PlataformModel getPlataform() {
        return plataform;
    }
    public void setPlataform(PlataformModel plataform) {
        this.plataform = plataform;
    }
    public Boolean getDeletedAccount() {
        return deletedAccount;
    }
    public void setDeletedAccount(Boolean deletedAccount) {
        this.deletedAccount = deletedAccount;
    }
    public Date getStartDate() {
        return startDate;
    }
    public void setStartDate(Date startDate) {
        this.startDate = startDate;
    }
    public Boolean getBlockedAccount() {
        return blockedAccount;
    }
    public void setBlockedAccount(Boolean blockedAccount) {
        this.blockedAccount = blockedAccount;
    }
    public Double getLastBlockTime() {
        return lastBlockTime;
    }
    public void setLastBlockTime(Double lastBlockTime) {
        this.lastBlockTime = lastBlockTime;
    }
    public Double getReactions() {
        return reactions;
    }
    public void setReactions(Double reactions) {
        this.reactions = reactions;
    }
}
