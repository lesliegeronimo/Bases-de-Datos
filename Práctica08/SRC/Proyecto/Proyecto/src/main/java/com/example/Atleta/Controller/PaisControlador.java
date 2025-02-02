/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.example.Atleta.Controller;

import jakarta.annotation.Resource;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.Atleta.Service.PaisS;
import com.example.Atleta.model.Pais;


@RestController
@RequestMapping("/postgressApp")
public class PaisControlador {
    @Resource
    PaisS paisS;
   
   @GetMapping(value="/paisList")
   public List<Pais> getPaises(){
       return paisS.findAll();
   }
   @PostMapping(value="/createPais")
   public void createPais(@RequestBody Pais op){
       paisS.insertarPais(op);
   }
   
   @PutMapping(value ="/updatePais")
   public void updatePais(@RequestBody Pais op){
       paisS.updatePais(op);
   }
   
   @PutMapping(value ="/executeUpdatePais")
   public void executeUpatePais(@RequestBody Pais op){
       paisS.executeUpatePais(op);
   }
   
   @DeleteMapping(value = "/deletePaisById")
   public void deletePais(@RequestBody Pais op){
       paisS.deletePais(op);
   }
    
}
