package com.generation.javeat.model.dtoservices;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.generation.javeat.model.dto.delivery.DeliveryDtoR;
import com.generation.javeat.model.entities.Delivery;
import com.generation.javeat.repositories.DeliveryRepository;
import com.generation.javeat.repositories.UserRepository;

@Service
public class DeliveryConverter {
    @Autowired
    DeliveryRepository dRepo;
    @Autowired
    UserRepository uRepo;

    public Delivery DtoRToDelivery(DeliveryDtoR dto) {
        return Delivery
                .builder()
                .id(dto.getId())
                .expected_arrival(dto.getExpected_arrival())
                .distance(dto.getDistance())
                .paymentMethod(dto.getPaymentMethod())
                .notes(dto.getNotes())
                .build();
    }
}
