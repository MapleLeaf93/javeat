package com.generation.javeat.model.dtoservices;

import java.time.LocalDateTime;
import java.util.HashSet;
import java.util.Map;
import java.util.Optional;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.generation.javeat.model.dto.delivery.DeliveryDtoRPost;
import com.generation.javeat.model.dto.delivery.DeliveryDtoWFull;
import com.generation.javeat.model.dto.delivery.DeliveryDtoWRecap;
import com.generation.javeat.model.entities.Delivery;
import com.generation.javeat.model.entities.Dish;
import com.generation.javeat.model.entities.DishToDelivery;
import com.generation.javeat.model.entities.Restaurant;
import com.generation.javeat.model.entities.User;
import com.generation.javeat.repositories.DeliveryRepository;
import com.generation.javeat.repositories.DishRepository;
import com.generation.javeat.repositories.RestaurantRepository;
import com.generation.javeat.repositories.UserRepository;

@Service
public class DeliveryConverter {

    @Autowired
    DeliveryRepository dRepo;

    @Autowired
    DishRepository pRepo;

    @Autowired
    UserRepository uRepo;

    @Autowired
    RestaurantRepository rRepo;

    public Delivery DtoRToDelivery(DeliveryDtoRPost dto) {

        Restaurant r = null;
        Integer res_id = dto.getRestaurant_id();

        if (res_id != null) {

            Optional<Restaurant> or = rRepo.findById(res_id);
            if (or.isPresent())
                r = or.get();
        }

        User u = null;
        Integer user_id = dto.getUser_id();

        if (user_id != null) {

            Optional<User> ou = uRepo.findById(user_id);
            if (ou.isPresent())
                u = ou.get();
        }
        Delivery delivery = Delivery
                .builder()
                .expected_arrival(dto.getExpected_arrival())
                .distance(calculateDistance(r, u))
                .payment_method(dto.getPayment_method())
                .notes(dto.getNotes())
                .user(u)
                .restaurant(r)
                .build();

        delivery.setDishesDeliveries(riempiLista(dto.getIdPiattoToQuantita(), delivery));

        return delivery;
    }

    private Set<DishToDelivery> riempiLista(Map<Integer, Integer> mappa, Delivery delivery) {

        Set<DishToDelivery> dishesDeliveries = new HashSet<DishToDelivery>();

        for (Map.Entry<Integer, Integer> entry : mappa.entrySet()) {

            Dish d = null;
            Integer dish_id = entry.getKey();

            if (dish_id != null) {

                Optional<Dish> od = pRepo.findById(dish_id);
                if (od.isPresent())
                    d = od.get();

            }
            DishToDelivery dtd = new DishToDelivery();
            dtd.setDish(d);
            dtd.setQuantity(entry.getValue());
            dtd.setDelivery(delivery);
            dishesDeliveries.add(dtd);
        }
        return dishesDeliveries;
    }

    private int calculateDistance(Restaurant r, User u) {

        int xr = r.getPositionX();
        int yr = r.getPositionY();
        int xu = u.getPositionX();
        int yu = u.getPositionY();

        int distanza = (int) Math.sqrt(Math.pow(xu - xr, 2) + Math.pow(yu - yr, 2));

        return distanza;
    }

    public DeliveryDtoWRecap deliveryToDtoWRecap(Delivery d) {

        Restaurant r = rRepo.findById(d.getRestaurant().getId()).get();

        return DeliveryDtoWRecap
                .builder()
                .id(d.getId())
                .expected_arrival(d.getExpected_arrival())
                .payment_method(d.getPayment_method())
                .notes(d.getNotes())
                .total_price(d.getTotalPrice())
                .restaurant_name(r.getName())
                .img_url(r.getImgUrl())
                .phone(r.getPhone())
                .dishesDeliveries(d.getDishesDeliveries())
                .build();
    }
}
