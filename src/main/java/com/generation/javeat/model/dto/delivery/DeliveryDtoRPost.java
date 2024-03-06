package com.generation.javeat.model.dto.delivery;

import java.time.LocalTime;
import java.util.Map;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.SuperBuilder;

@Data
@AllArgsConstructor
@NoArgsConstructor
@SuperBuilder
public class DeliveryDtoRPost extends DeliveryDtoBase {

    private Integer user_id;
    private Integer restaurant_id;
    private LocalTime deliveryTime;
    // piatto-quantita
    private Map<Integer, DishDescription> idPiattoToQuantita;

    @Data
    @AllArgsConstructor
    @NoArgsConstructor
    public static class DishDescription {

        private int quantita;
        private String added_ingredients;
        private String removed_ingredients;
    }
}
