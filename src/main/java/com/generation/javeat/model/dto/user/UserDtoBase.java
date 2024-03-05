package com.generation.javeat.model.dto.user;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.SuperBuilder;

@Data
@AllArgsConstructor
@NoArgsConstructor
@SuperBuilder

public class UserDtoBase {
    private String mail, password, phone, name;
    private int positionX, positionY;
}
