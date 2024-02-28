package com.generation.javeat.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.generation.javeat.model.entities.Menu;

public interface MenuRepository extends JpaRepository<Menu, Integer> {

}
