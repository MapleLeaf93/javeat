package com.generation.javeat.model.dto.delivery;

import java.util.Set;

import com.generation.javeat.model.entities.DishToDelivery;
import com.generation.javeat.model.entities.Restaurant;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.SuperBuilder;

@Data
@AllArgsConstructor
@NoArgsConstructor
@SuperBuilder
public class DeliveryDtoWFull extends DeliveryDtoBase {

    // distanza no aggiungere prezzo totale du delivery

    private Restaurant restaurant; // solo nome e url e phone
    private Set<DishToDelivery> dishesDeliveries; // piatti
    // aggiungere id delivery
}
