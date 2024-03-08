package com.generation.javeat.model.entities;

import java.time.LocalTime;
import java.util.List;
import java.util.Set;

import com.fasterxml.jackson.annotation.JsonIgnore;

import io.swagger.v3.oas.annotations.media.Schema;
import jakarta.persistence.CascadeType;
import jakarta.persistence.CollectionTable;
import jakarta.persistence.Column;
import jakarta.persistence.ElementCollection;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.OneToMany;
import jakarta.persistence.OneToOne;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.experimental.SuperBuilder;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Entity
@SuperBuilder
@Schema(description = "Ristorante")
public class Restaurant {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Schema(description = "ID autoincrementale")
    private Integer id;

    @Schema(description = "Nome ristorante")
    private String name;
    @Schema(description = "Numero di telefono")
    private String phone;
    @Schema(description = "Immagine ristorante")
    private String imgUrl;
    @Schema(description = "Orario apertura")
    private LocalTime openingHour;
    @Schema(description = "Orario chiusura")
    private LocalTime closingHour;
    @Schema(description = "Coordinata X")
    private int positionX;
    @Schema(description = "Coordinata Y")
    private int positionY;
    @Schema(description = "Massima distanza ")
    private int maxDeliveryDistance;
    @Schema(description = "Prezzo spedizione per unità di distanza")
    private Double deliveryPricePerUnit;

    @ElementCollection(targetClass = String.class, fetch = FetchType.EAGER)
    @CollectionTable(name = "foodTypes", joinColumns = @JoinColumn(name = "restaurant_id"))
    @Column(name = "foodType", nullable = true)
    @Schema(description = "Tipologia ristorante")
    private List<String> foodTypes;

    @JsonIgnore
    @OneToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "menu", referencedColumnName = "id")
    @Schema(description = "ID del menu")
    private Menu menu;

    @JsonIgnore
    @OneToMany(mappedBy = "restaurant", fetch = FetchType.EAGER)
    @Schema(description = "Lista di ordini del ristorante")
    private Set<Delivery> deliveries;

}
