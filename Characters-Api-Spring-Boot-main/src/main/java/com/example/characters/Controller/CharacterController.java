package com.example.characters.Controller;

import com.example.characters.Model.CharacterType;
import com.example.characters.Model.Characters;
import com.example.characters.Model.Planets;
import com.example.characters.Repository.CharacterRepository;
import com.example.characters.Repository.CharacterTypeRepository;
import com.example.characters.Repository.PlanetsRepository;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.*;

import java.util.Optional;

@RestController
@RequestMapping(value = "/api/")
public class CharacterController {

    @Autowired
    private CharacterRepository characterRepository;

    @Autowired
    private PlanetsRepository planetsRepository;
    @Autowired
    private CharacterTypeRepository characterTypeRepository;


    @GetMapping
    public ResponseEntity<Page<Characters>> getAllCharacters (
            @RequestParam(defaultValue = "0") int page ,
           @RequestParam(defaultValue = "10") int size){

             Pageable pageable = PageRequest.of(page, size);
            Page<Characters> characterPage = characterRepository.findAll(pageable);
                return ResponseEntity.ok(characterPage);
      }

    @GetMapping(value = "/hello")
    public String hello() {
        return "Hello, world!";
    }

    @GetMapping(value = "/character/{characterId}")
    public ResponseEntity<Characters> getCharactersById(@PathVariable Long characterId) {
        Optional<Characters> optionalCharacters = characterRepository.findByCharacterId(characterId);
        if (optionalCharacters.isPresent()) {
            Characters character = optionalCharacters.get();
            return new ResponseEntity<>(character, HttpStatus.OK);
        } else {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
    }

    @GetMapping(value = "/planet/{planetId}")
    public ResponseEntity<Planets> getPlanetById(@PathVariable Long planetId) {
        Optional<Planets> optionalPlanets = planetsRepository.findByPlanetId(planetId);
        if (optionalPlanets.isPresent()) {
            Planets planet = optionalPlanets.get();
            return new ResponseEntity<>(planet, HttpStatus.OK);
        } else {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
    }

    @GetMapping(value = "/character-type/{characterTypeId}")
    public ResponseEntity<CharacterType> getCharacterTypeById(@PathVariable Long characterTypeId) {
        Optional<CharacterType> optionalCharacterType = characterTypeRepository.findByCharacterTypeId(characterTypeId);
        if (optionalCharacterType.isPresent()) {
            CharacterType characterType = optionalCharacterType.get();
            return new ResponseEntity<>(characterType, HttpStatus.OK);
        } else {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
    }
}
