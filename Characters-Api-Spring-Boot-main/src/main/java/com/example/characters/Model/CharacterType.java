package com.example.characters.Model;
import jakarta.persistence.*;
import jakarta.persistence.Entity;
import jakarta.persistence.Table;

@Entity

@Table(name = "character_types")
public class CharacterType {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "character_type_id")
    private Long characterTypeId;

    private String name;

    // Getters and setters


    public Long getCharacterTypeId() {
        return characterTypeId;
    }

    public String getName() {
        return name;
    }

    public void setCharacterTypeId(Long characterTypeId) {
        this.characterTypeId = characterTypeId;
    }

    public void setName(String name) {
        this.name = name;
    }

}
