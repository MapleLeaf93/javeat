package com.generation.javeat.model.entities;

import java.time.LocalDateTime;
import java.util.Set;

import java.text.DecimalFormat;

import org.springframework.util.StringUtils;

import com.fasterxml.jackson.annotation.JsonIgnore;

import io.swagger.v3.oas.annotations.media.Schema;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
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
@Schema(description = "Informazioni sulla delivery")
public class Delivery {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    private LocalDateTime expected_arrival;
    private int distance;
    private String payment_method, notes;

    @JsonIgnore
    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "user_id")
    private User user;

    @JsonIgnore
    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "restaurant_id")
    private Restaurant restaurant;

    @JsonIgnore
    @OneToMany(mappedBy = "delivery", fetch = FetchType.EAGER)
    private Set<DishToDelivery> dishesDeliveries;

    public double getDishesPrice() {

        return dishesDeliveries.stream()
                .mapToDouble(i -> ((i.getDish().getPrice()) * i.getQuantity()) + count_added_ingredients(i)).sum();
    }

    public int count_added_ingredients(DishToDelivery d) {

        int res = StringUtils.countOccurrencesOf(d.getAdded_ingredients(), ",");

        if (d.getAdded_ingredients() == "")
            return 0;

        return res + 1;
    }

    public double getRiderRevenue() {

        return distance * restaurant.getDeliveryPricePerUnit();
    }

    public double getTotalPrice() {

        // tronca i decimali
        double total = getDishesPrice() + getRiderRevenue();
        double truncatedTotal = Math.floor(total * 100) / 100;

        return truncatedTotal;
    }
}
