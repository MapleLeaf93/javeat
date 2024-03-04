package com.generation.javeat.model.dto.delivery;

import java.time.LocalDateTime;
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
public class DeliveryDtoWRecap {

    // ordine
    private Integer id;
    private LocalDateTime expected_arrival;
    private String payment_method;
    private String notes;
    private double total_price;
    // ristorante
    private String restaurant_name;
    private String img_url;
    private String phone;
    // piatti
    private Set<DishToDelivery> dishesDeliveries;

}
