package com.generation.javeat.model.dtoservices;

import java.time.LocalTime;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.generation.javeat.model.dto.delivery.DeliveryDtoRPost;
import com.generation.javeat.model.entities.Delivery;
import com.generation.javeat.model.entities.Restaurant;
import com.generation.javeat.model.entities.User;
import com.generation.javeat.repositories.DeliveryRepository;
import com.generation.javeat.repositories.RestaurantRepository;
import com.generation.javeat.repositories.UserRepository;

@Service
public class DeliveryConverter {

    @Autowired
    DeliveryRepository dRepo;

    @Autowired
    UserRepository uRepo;

    @Autowired
    RestaurantRepository rRepo;

    public Delivery DtoRToDelivery(DeliveryDtoRPost dto) {

        Restaurant r = rRepo.findById(dto.getRestaurant_id()).get();
        User u = uRepo.findById(dto.getRestaurant_id()).get();

        return Delivery
                .builder()
                .expected_arrival(calculateArrival(dto))
                .distance(calculateDistance(r, u))
                .paymentMethod(dto.getPaymentMethod())
                .notes(dto.getNotes())
                .user(u)
                .restaurant(r)
                .build();
    }

    private LocalTime calculateArrival(DeliveryDtoRPost dto) {

        return LocalTime.now().plusHours(dto.getExpected_arrival().getHour())
                .plusMinutes(dto.getExpected_arrival().getMinute())
                .plusSeconds(dto.getExpected_arrival().getSecond());
    }

    private int calculateDistance(Restaurant r, User u) {

        int xr = r.getPositionX();
        int yr = r.getPositionY();
        int xu = u.getPositionX();
        int yu = u.getPositionY();

        int distanza = (int) Math.sqrt(Math.pow(xu - xr, 2) + Math.pow(yu - yr, 2));

        return distanza;
    }

}
