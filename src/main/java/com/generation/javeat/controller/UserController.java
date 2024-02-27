package com.generation.javeat.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.generation.javeat.entities.User;
import com.generation.javeat.repositories.UserRepository;

@RestController
public class UserController {

    @Autowired
    UserRepository uRepo;

    @Autowired
    UserConverter uConv;

    @PostMapping("/register")
    public ResponseEntity<?> register(@RequestBody UserDtoRpost dto) {

        User u = dto.uConv.dtoRpostToUser(dto);

        if (u.isValid())
            return new ResponseEntity<User>(uRepo.save(u), HttpStatus.OK);

        return new ResponseEntity<String>("User non valido", HttpStatus.BAD_REQUEST);

    }

    @GetMapping("/login")
    public ResponseEntity<?> login(@RequestBody UserDtoRlog dto) {

        String mail = dto.getMail();
        String password = dto.getPassword();

        User u = uRepo.findByMail(mail);

        if (u != null && u.getPassword().equals(password))
            return new ResponseEntity<User>(u, HttpStatus.OK);

        return new ResponseEntity<String>("Invalid credentials", HttpStatus.UNAUTHORIZED);
    }
}