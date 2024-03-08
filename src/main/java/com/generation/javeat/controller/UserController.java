package com.generation.javeat.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.generation.javeat.model.dto.user.UserDtoR;
import com.generation.javeat.model.dto.user.UserDtoRLog;
import com.generation.javeat.model.dto.user.UserDtoWLog;
import com.generation.javeat.model.dtoservices.UserConverter;
import com.generation.javeat.model.entities.User;
import com.generation.javeat.repositories.UserRepository;

import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.media.Content;
import io.swagger.v3.oas.annotations.media.Schema;
import io.swagger.v3.oas.annotations.responses.ApiResponse;
import io.swagger.v3.oas.annotations.responses.ApiResponses;

@RestController
public class UserController {

    @Autowired
    UserRepository uRepo;

    @Autowired
    UserConverter uConv;

    @PostMapping("/register")
    @Operation(description = "registrazione dell'utente, prende tutte le proprietà dell'utente")
    @ApiResponses(value = {
            @ApiResponse(description = "registrato con successo", responseCode = "200", useReturnTypeSchema = true, content = @Content(mediaType = "application/json", schema = @Schema(implementation = User.class))),
            @ApiResponse(description = "User non valido", responseCode = "400", content = @Content(mediaType = "text"))
    })
    public ResponseEntity<?> register(@RequestBody UserDtoR dto) {

        User u = uConv.dtoRpostToUser(dto);

        if (u.isValid())
            return new ResponseEntity<User>(uRepo.save(u), HttpStatus.OK);

        return new ResponseEntity<String>("User non valido", HttpStatus.BAD_REQUEST);

    }

    @PostMapping("/login")
    @Operation(description = "Riceve login dell'utente e verifica le credenziali")
    @ApiResponses(value = {
            @ApiResponse(description = "loggato con successo", responseCode = "200", useReturnTypeSchema = true, content = @Content(mediaType = "application/json", schema = @Schema(implementation = User.class))),
            @ApiResponse(description = "Invalid credentials", responseCode = "401", content = @Content(mediaType = "text"))
    })
    public ResponseEntity<?> login(@RequestBody UserDtoRLog dto) {

        String mail = dto.getMail();
        String password = dto.getPassword();

        User u = uRepo.findByMail(mail);

        if (u != null && u.getPassword().equals(password))
            return new ResponseEntity<UserDtoWLog>(uConv.userToDtoWLog(u), HttpStatus.OK);

        return new ResponseEntity<String>("Invalid credentials", HttpStatus.UNAUTHORIZED);
    }
}