package com.generation.javeat.entities;

import java.util.List;
import java.util.Set;

import com.fasterxml.jackson.annotation.JsonIgnore;

import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.SuperBuilder;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
@SuperBuilder

public class Restaurant 
{
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    private String phone, imgUrl;
    private int openingHour, closingHour;
    private int positionX, positionY;
    private int maxDeliveryDistance;
    private Double deliveryPricePerUnit;
    private List<String> foodType;

    @JsonIgnore
    @OneToMany(mappedBy = "restaurant",fetch = FetchType.EAGER)
    private Set <Menu> menu;

    @JsonIgnore
    @OneToMany(mappedBy = "delivery", fetch = FetchType.EAGER)
    private Set<Delivery> deliveries;

}
