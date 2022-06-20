package com.carlosamaral.backend.repository;

import com.carlosamaral.backend.model.PlataformModel;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface PlataformRepository extends JpaRepository<PlataformModel, Long> {
}
