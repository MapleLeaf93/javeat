package com.generation.javeat.model.entities;

import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import com.fasterxml.jackson.annotation.JsonIgnore;

import io.swagger.v3.oas.annotations.media.Schema;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
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
@Schema(description = "Utente da inserire in login, a cui sarà associato il carrello e gli acquisti")
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Schema(description = "Id autoincrementato")
    private Integer id;
    @Schema(description = "Mail robusta: almeno una lettera minuscola, una lettera maiuscola, la @, almeno un carattere speciale, almeno un numero, in generale composto da 2 a 7 lettere alfabetiche ")
    private String mail;
    @Schema(description = "Password robusta: almeno una lettera minuscola, una lettera maiuscola, una cifra e un carattere speciale")
    private String password;
    private String phone;
    private String name;
    @Schema(description = "la posizione è in unità")
    private int positionX, positionY;

    @JsonIgnore
    @OneToMany(mappedBy = "user", fetch = FetchType.EAGER)
    @Schema(description = "una lista di ordini dell'utente")
    private List<Delivery> deliveries;

    public boolean isValidEmail(String email) {
        Pattern pattern = Pattern
                .compile("^[a-zA-Z0-9_+&*-]+(?:\\.[a-zA-Z0-9_+&*-]+)*@(?:[a-zA-Z0-9-]+\\.)+[a-zA-Z]{2,7}$");
        Matcher matcher = pattern.matcher(email);
        return matcher.matches();
    }

    public boolean isValidPassword(String password) {

        Pattern pattern = Pattern.compile("^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[@#$%^&+=!]).+$");
        Matcher matcher = pattern.matcher(password);
        return matcher.matches();
    }

    public boolean isValidPhone(String phone) {

        Pattern pattern = Pattern
                .compile("^(?:(?:\\+|00)\\d{1,3})?[\\s.-]?\\(?(\\d{3})\\)?[\\s.-]?(\\d{3})[\\s.-]?(\\d{4})$");
        Matcher matcher = pattern.matcher(phone);
        return matcher.matches();
    }

    public boolean isValid() {

        return id != null && isValidEmail(mail) &&
                isValidPassword(password) && isValidPhone(phone) &&
                positionX >= 0 && positionX <= 1000 &&
                positionY >= 0 && positionX <= 1000;

    }
}
