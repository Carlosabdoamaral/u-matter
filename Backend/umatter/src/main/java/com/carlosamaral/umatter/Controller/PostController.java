package com.carlosamaral.umatter.Controller;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@CrossOrigin
@RestController
@RequestMapping("/post")
public class PostController {
    @GetMapping
    public HttpStatus test() {
        return HttpStatus.OK;
    }
}
