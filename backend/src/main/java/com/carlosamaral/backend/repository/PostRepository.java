package com.carlosamaral.backend.repository;

import com.carlosamaral.backend.model.PostModel;
import org.springframework.data.jpa.repository.JpaRepository;

public interface PostRepository extends JpaRepository<PostModel, Long> {  }
