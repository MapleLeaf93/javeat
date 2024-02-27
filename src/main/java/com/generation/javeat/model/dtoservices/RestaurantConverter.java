package com.generation.javeat.model.dtoservices;

import java.time.LocalTime;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.generation.javeat.entities.Restaurant;
import com.generation.javeat.entities.User;
import com.generation.javeat.model.dto.resturant.RestaurantDtoWSimple;
import com.generation.javeat.repositories.UserRepository;

@Service
public class RestaurantConverter {

    @Autowired
    UserRepository uRepo;

    public RestaurantDtoWSimple restaurantToDtoWSimple(Restaurant r, Integer user_id) {

        User currentUser = uRepo.findById(user_id).get();

        return RestaurantDtoWSimple
                .builder()
                .id(r.getId())
                .name(r.getName())
                .imgUrl(r.getImgUrl())
                .foodTypes(r.getFoodTypes())
                .isOpen(isOpen(r))
                .distance(calculateDistance(r, currentUser))
                .build();
    }

    private int calculateDistance(Restaurant r, User currentUser) {

        int xr = r.getPositionX();
        int yr = r.getPositionY();
        int xu = currentUser.getPositionX();
        int yu = currentUser.getPositionY();

        int distanza = (int) Math.sqrt(Math.pow(xu - xr, 2) + Math.pow(yu - yr, 2));

        return distanza;
    }

    private boolean isOpen(Restaurant r) {

        return LocalTime.now().isBefore(r.getClosingHour());
    }
}
