package com.carlosamaral.backend.model;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import java.sql.Date;
@Entity(name = "post")
public class PostModel {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @NotNull
    private Long post_id;

    @NotNull
    @ManyToOne // Revisar relacao
    private PersonModel author;

    @NotNull
    private String title;

    @NotNull
    private String content;

    @NotNull
    private Date date;

    private Integer reactions;

    private Integer views;

    public String getTitle() {
        return title;
    }
    public void setTitle(String title) {
        this.title = title;
    }
    public String getContent() {
        return content;
    }
    public void setContent(String content) {
        this.content = content;
    }
    public Date getDate() {
        return date;
    }
    public void setDate(Date date) {
        this.date = date;
    }
    public Integer getReactions() {
        return reactions;
    }
    public void setReactions(Integer reactions) {
        this.reactions = reactions;
    }
    public Integer getViews() {
        return views;
    }
    public void setViews(Integer views) {
        this.views = views;
    }
}
