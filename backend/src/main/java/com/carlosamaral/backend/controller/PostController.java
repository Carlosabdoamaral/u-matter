package com.carlosamaral.backend.controller;
import com.carlosamaral.backend.model.PostModel;
import com.carlosamaral.backend.repository.PostRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;
import java.util.List;
import java.util.Optional;

@CrossOrigin
@RestController
@RequestMapping("/post")
public class PostController {
    @Autowired
    private PostRepository _postRepository;

    @GetMapping("/all")
    private List<PostModel> getAllPosts() {
        return _postRepository.findAll();
    }

    @GetMapping("/{id}")
    private Optional<PostModel> getById(@PathVariable Long id) {
        return _postRepository.findById(id);
    }

    @DeleteMapping("/{id}")
    private HttpStatus deleteById(@PathVariable Long id) {
        try {
            _postRepository.deleteById(id);
            return HttpStatus.OK;
        } catch (Error e) {
            return HttpStatus.INTERNAL_SERVER_ERROR;
        }
    }
}
