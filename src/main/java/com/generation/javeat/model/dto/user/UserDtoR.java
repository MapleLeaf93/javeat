package com.generation.javeat.model.dto.user;

import lombok.Data;
import lombok.experimental.SuperBuilder;

@SuperBuilder
@Data

public class UserDtoR extends UserDtoBase
{
    public UserDtoR(){}
    private Integer id;
}
