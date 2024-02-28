package com.generation.javeat.model.dtoservices;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.generation.javeat.model.dto.dishtodelivery.DishToDeliveryDtoR;
import com.generation.javeat.model.entities.Delivery;
import com.generation.javeat.model.entities.Dish;
import com.generation.javeat.model.entities.DishToDelivery;
import com.generation.javeat.repositories.DeliveryRepository;
import com.generation.javeat.repositories.DishRepository;

@Service
public class DishToDeliveryConverter {

    @Autowired
    DishRepository dRepo;

    @Autowired
    DeliveryRepository delRepo;

    public DishToDelivery dtoToDishToDelivery(DishToDeliveryDtoR dto) {

        Dish piatto = dRepo.findById(dto.getDish_id()).get();
        Delivery delivery = delRepo.findById(dto.getDelivery_id()).get();

        return DishToDelivery
                .builder()
                .quantity(dto.getQuantity())
                .dish(piatto)
                .delivery(delivery)
                .build();
    }
}
