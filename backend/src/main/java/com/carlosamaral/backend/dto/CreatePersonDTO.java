package com.carlosamaral.backend.dto;

import java.util.Date;

public class CreatePersonDTO {
    private String uuid;
    private Long plataform_id;

    public String getUuid() {
        return uuid;
    }
    public void setUuid(String uuid) {
        this.uuid = uuid;
    }
    public Long getPlataform_id() {
        return plataform_id;
    }
    public void setPlataform_id(Long plataform_id) {
        this.plataform_id = plataform_id;
    }
}
