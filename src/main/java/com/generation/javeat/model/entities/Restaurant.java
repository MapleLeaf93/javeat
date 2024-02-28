package com.generation.javeat.model.entities;

import java.time.LocalTime;
import java.util.List;
import java.util.Set;

import com.fasterxml.jackson.annotation.JsonIgnore;

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

public class Restaurant {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    private String name, phone, imgUrl;
    private LocalTime openingHour, closingHour;
    private int positionX, positionY;
    private int maxDeliveryDistance;
    private Double deliveryPricePerUnit;

    @ElementCollection(targetClass = String.class, fetch = FetchType.EAGER)
    @CollectionTable(name = "foodTypes", joinColumns = @JoinColumn(name = "restaurant_id"))
    @Column(name = "foodType", nullable = false)
    private List<String> foodTypes;

    @JsonIgnore
    @OneToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "menu", referencedColumnName = "id")
    private Menu menu;

    @JsonIgnore
    @OneToMany(mappedBy = "restaurant", fetch = FetchType.EAGER)

    private Set<Delivery> deliveries;

}
