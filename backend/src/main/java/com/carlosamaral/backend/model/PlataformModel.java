package com.carlosamaral.backend.model;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import java.util.List;

@Entity(name = "plataform")
public class PlataformModel {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long plataform_id;

    @NotNull
    private String title;

    @OneToMany(mappedBy = "person_id")
    private List<PersonModel> person;

    public String getTitle() {
        return title;
    }
    public void setTitle(String title) {
        this.title = title;
    }
}
