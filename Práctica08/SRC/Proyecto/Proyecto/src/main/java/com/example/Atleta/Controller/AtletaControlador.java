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

import com.example.Atleta.Service.AtletaS;
import com.example.Atleta.model.Atleta;


@RestController
@RequestMapping("/postgressApp")
public class AtletaControlador {
    @Resource
    AtletaS atletaS;
   
   @GetMapping(value="/atletaList")
   public List<Atleta> getAtletas(){
       return atletaS.findAll();
   }
   @PostMapping(value="/createAtl")
   public void createAtl(@RequestBody Atleta op){
       atletaS.insertarAtleta(op);
   }
   
   @PutMapping(value ="/updateAtl")
   public void updateAtl(@RequestBody Atleta op){
      atletaS.updateAtleta(op);
   }
   
   @PutMapping(value ="/executeUpdateAtl")
   public void executeUpateAtleta(@RequestBody Atleta op){
      atletaS.executeUpateAtleta(op);
   }
   
   @DeleteMapping(value = "/deleteAtletaById")
   public void borrarAtleta(@RequestBody Atleta op){
       atletaS.deleteAtleta(op);
   }
    
}
