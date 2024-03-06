package com.generation.javeat.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.generation.javeat.model.dto.delivery.DeliveryDtoRPost;
import com.generation.javeat.model.dto.delivery.DeliveryDtoWRecap;
import com.generation.javeat.model.dtoservices.DeliveryConverter;
import com.generation.javeat.model.entities.Delivery;
import com.generation.javeat.model.entities.User;
import com.generation.javeat.repositories.DeliveryRepository;
import com.generation.javeat.repositories.DishToDeliveryRepository;
import com.generation.javeat.repositories.UserRepository;

import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.Parameter;
import io.swagger.v3.oas.annotations.media.Content;
import io.swagger.v3.oas.annotations.media.Schema;
import io.swagger.v3.oas.annotations.responses.ApiResponse;
import io.swagger.v3.oas.annotations.responses.ApiResponses;

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
    @Operation(description = "Inserisce nuova delivery sul db")
    @ApiResponses(value = {
            @ApiResponse(description = "Inserimento avvenuto con successo", responseCode = "200", useReturnTypeSchema = true, content = @Content(mediaType = "application/json", schema = @Schema(implementation = Delivery.class)))
    })
    public ResponseEntity<?> insertDelivery(@RequestBody DeliveryDtoRPost dto) {

        Delivery d = dConv.DtoRToDelivery(dto);
        d = dRepo.save(d);
        dtdRepo.saveAll(d.getDishesDeliveries());
        return new ResponseEntity<Delivery>(d, HttpStatus.OK);
    }

    @GetMapping("/delivery/{id}")
    @Operation(description = "Restituisce lista di ordini legate all'utente")
    @ApiResponses(value = {
            @ApiResponse(description = "Lista ordini trovata", responseCode = "200", useReturnTypeSchema = true, content = @Content(mediaType = "application/json", schema = @Schema(implementation = DeliveryDtoWRecap.class))),
            @ApiResponse(description = "Lista ordini non trovata", responseCode = "404", content = @Content(mediaType = "text"))
    })
    public ResponseEntity<?> getMyDeliveries(@PathVariable @Parameter(description = "id utente") Integer id) {

        User user = uRepo.findById(id).get();

        if (user.getDeliveries().isEmpty())
            return new ResponseEntity<String>("Nessuna delivery", HttpStatus.NOT_FOUND);

        List<DeliveryDtoWRecap> deliveries = user.getDeliveries().stream().map(e -> dConv.deliveryToDtoWRecap(e))
                .toList();
        return new ResponseEntity<List<DeliveryDtoWRecap>>(deliveries, HttpStatus.OK);
    }

}
