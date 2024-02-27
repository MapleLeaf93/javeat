package com.generation.javeat.model.dto.user;

import lombok.Data;
import lombok.experimental.SuperBuilder;

@SuperBuilder
@Data

public class UserDtoRLog 
{
    private String mail;
    private String password;
}
