package com.generation.javeat.model.dto.menu;

import lombok.Data;
import lombok.experimental.SuperBuilder;

@SuperBuilder
@Data

public class MenuDtoR extends MenuDtoBase
{
    public MenuDtoR(){}
    private Integer id;
}
