package com.generation.javeat.model.dto.delivery;

import java.util.Set;

import com.generation.javeat.model.entities.DishToDelivery;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.SuperBuilder;

@Data
@AllArgsConstructor
@NoArgsConstructor
@SuperBuilder
public class DeliveryDtoRPost extends DeliveryDtoBase {

    Integer user_id;
    Integer restaurant_id;
    private Set<DishToDelivery> dishesDeliveries;
}
