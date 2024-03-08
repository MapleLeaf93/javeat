package com.generation.javeat.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import com.generation.javeat.model.dto.resturant.RestaurantDtoWFull;
import com.generation.javeat.model.dto.resturant.RestaurantDtoWSimple;
import com.generation.javeat.model.dtoservices.RestaurantConverter;
import com.generation.javeat.model.entities.Restaurant;
import com.generation.javeat.repositories.RestaurantRepository;

import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.media.Content;
import io.swagger.v3.oas.annotations.media.Schema;
import io.swagger.v3.oas.annotations.responses.ApiResponse;
import io.swagger.v3.oas.annotations.responses.ApiResponses;

@RestController
public class RestaurantController {

    @Autowired
    RestaurantRepository rRepo;

    @Autowired
    RestaurantConverter rConv;

    @GetMapping("/restaurants/{id}")
    @Operation(description = "Restituisce lista ristoranti in base all'utente")
    @ApiResponses(value = {
            @ApiResponse(description = "Lista ristorante trovata", responseCode = "200", useReturnTypeSchema = true, content = @Content(mediaType = "application/json", schema = @Schema(implementation = RestaurantDtoWSimple.class)))
    })
    public List<RestaurantDtoWSimple> getAllRestaurants(@PathVariable Integer id) {

        return rRepo.findAll().stream().map(i -> rConv.restaurantToDtoWSimple(i, id))
                .filter(i -> i.getDistance() <= i.getMaxDeliveryDistance()).toList();
    }

    @GetMapping("/restaurant/full/{user_id}/{res_id}")
    @Operation(description = "Restituisce dettagli ristorante")
    @ApiResponses(value = {
            @ApiResponse(description = "Ristorante trovato", responseCode = "200", useReturnTypeSchema = true, content = @Content(mediaType = "application/json", schema = @Schema(implementation = RestaurantDtoWFull.class)))
    })
    public RestaurantDtoWFull getRestaurantFull(@PathVariable Integer user_id, @PathVariable Integer res_id) {

        Restaurant r = rRepo.findById(res_id).get();

        return rConv.restaurantToDtoWFull(r, user_id);
    }
}
