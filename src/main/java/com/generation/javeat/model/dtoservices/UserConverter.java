package com.generation.javeat.model.dtoservices;

import org.springframework.stereotype.Service;

import com.generation.javeat.entities.User;

@Service
public class UserConverter {

    public User dtoRpostToUser(UserDtoRpost dto){

        return User
                .builder()
                .mail(dto.getMail())
                .password(dto.getPassword())
                .phone(dto.get)
    }

}
