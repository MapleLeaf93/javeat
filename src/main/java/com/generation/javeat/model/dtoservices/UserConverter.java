package com.generation.javeat.model.dtoservices;

import org.springframework.stereotype.Service;

import com.generation.javeat.model.dto.user.UserDtoR;
import com.generation.javeat.model.dto.user.UserDtoWLog;
import com.generation.javeat.model.entities.User;

@Service
public class UserConverter {

    public User dtoRpostToUser(UserDtoR dto) {

        return User
                .builder()
                .mail(dto.getMail())
                .password(dto.getPassword())
                .phone(dto.getPhone())
                .name(dto.getName())
                .positionX(dto.getPositionX())
                .positionY(dto.getPositionY())
                .build();
    }

    public UserDtoWLog userToDtoWLog(User u) {
        return UserDtoWLog
                .builder()
                .id(u.getId())
                .name(u.getName())
                .mail(u.getMail())
                .password(u.getPassword())
                .build();
    }

}
