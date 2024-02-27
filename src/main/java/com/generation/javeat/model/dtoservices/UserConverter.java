package com.generation.javeat.model.dtoservices;

import org.springframework.stereotype.Service;

import com.generation.javeat.entities.User;
import com.generation.javeat.model.dto.user.UserDtoR;
import com.generation.javeat.model.dto.user.UserDtoWLog;

@Service
public class UserConverter {

    public User dtoRpostToUser(UserDtoR dto) {

        return User
                .builder()
                .mail(dto.getMail())
                .password(dto.getPassword())
                .phone(dto.getPhone())
                .positionX(dto.getPositionX())
                .positionY(dto.getPositionY())
                .build();
    }

    public UserDtoWLog userToDtoWLog(User u) {
        return UserDtoWLog
                .builder()
                .id(u.getId())
                .mail(u.getMail())
                .password(u.getPassword())
                .build();
    }

}
