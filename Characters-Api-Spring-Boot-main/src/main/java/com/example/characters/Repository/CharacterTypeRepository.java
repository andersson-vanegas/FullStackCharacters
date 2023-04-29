package com.example.characters.Repository;

import com.example.characters.Model.CharacterType;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface CharacterTypeRepository extends JpaRepository<CharacterType, Long> {
    Optional<CharacterType> findByCharacterTypeId(Long characterTypeId);
}
