package com.generation.javeat.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.service.annotation.GetExchange;

import com.generation.javeat.model.dto.delivery.DeliveryDtoRPost;
import com.generation.javeat.model.dto.delivery.DeliveryDtoWFull;
import com.generation.javeat.model.dtoservices.DeliveryConverter;
import com.generation.javeat.model.entities.Delivery;
import com.generation.javeat.model.entities.User;
import com.generation.javeat.repositories.DeliveryRepository;
import com.generation.javeat.repositories.DishToDeliveryRepository;
import com.generation.javeat.repositories.UserRepository;

@RestController
public class DeliveryController {

    @Autowired
    DeliveryConverter dConv;

    @Autowired
    DeliveryRepository dRepo;

    @Autowired
    UserRepository uRepo;

    @Autowired
    DishToDeliveryRepository dtdRepo;

    @PostMapping("/delivery")
    public ResponseEntity<?> insertDelivery(@RequestBody DeliveryDtoRPost dto) {

        Delivery d = dConv.DtoRToDelivery(dto);
        d = dRepo.save(d);
        dtdRepo.saveAll(d.getDishesDeliveries());
        return new ResponseEntity<Delivery>(d, HttpStatus.OK);
    }

    @GetExchange("/delivery/{id}")
    public ResponseEntity<?> getMyDeliveries(@PathVariable Integer id) {

        User user = uRepo.findById(id).get();

        if (user.getDeliveries().isEmpty())
            return new ResponseEntity<String>("Nessuna delivery", HttpStatus.BAD_REQUEST);

        List<DeliveryDtoWFull> deliveries = user.getDeliveries().stream().map(e -> dConv.deliveryToDtoWFull(e))
                .toList();
        return new ResponseEntity<List<DeliveryDtoWFull>>(deliveries, HttpStatus.OK);
    }

}
