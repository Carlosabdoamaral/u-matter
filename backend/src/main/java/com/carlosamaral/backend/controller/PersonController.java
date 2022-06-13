package com.carlosamaral.backend.controller;

import com.carlosamaral.backend.dto.CreatePersonDTO;
import com.carlosamaral.backend.model.PersonModel;
import com.carlosamaral.backend.repository.PersonRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;
import java.util.Date;
import java.util.List;
import java.util.Optional;

@CrossOrigin
@RestController
@RequestMapping("/person")
public class PersonController {
    @Autowired
    private PersonRepository _personRepository;

    @GetMapping("/all")
    private List<PersonModel> getAllUsers() {
        return _personRepository.findAll();
    }

    @GetMapping("/{id}")
    private Optional<PersonModel> getById(@PathVariable Long id) {
        return _personRepository.findById(id);
    }

    @PostMapping("/new")
    private HttpStatus createUser(@RequestBody CreatePersonDTO obj) {
        Date date = new Date();
        Boolean deletedAccount = false;
        _personRepository.createNewUser(obj.getUuid(), obj.getPlataform_id(), deletedAccount, date);
        return HttpStatus.CREATED;
    }

    @PutMapping("/block/{uuid}")
    private HttpStatus blockAccount(@PathVariable String uuid) {
        Double block = 3.0;
        try {
            _personRepository.blockPerson(uuid, block);
            return HttpStatus.OK;
        } catch (Error e) {
            return HttpStatus.CONFLICT;
        }
    }

    @DeleteMapping("/delete/{uuid}")
    private HttpStatus softDeleteAccount(@PathVariable String uuid) {
        try {
            _personRepository.softDeleteUser(uuid);
            return HttpStatus.OK;
        } catch (Error e) {
            return HttpStatus.CONFLICT;
        }
    }

}
