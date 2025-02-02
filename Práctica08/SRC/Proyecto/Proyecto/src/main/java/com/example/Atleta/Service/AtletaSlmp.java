/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.example.Atleta.Service;

import jakarta.annotation.Resource;
import java.util.List;
import org.springframework.stereotype.Service;

import com.example.Atleta.Repository.AtletaRepositorio;
import com.example.Atleta.model.Atleta;

/**
 *
 * @author ricardo
 */
@Service
public class AtletaSlmp implements AtletaS{
    @Resource
    AtletaRepositorio operadorRep;

    @Override
    public List<Atleta> findAll() {
        return operadorRep.findAll();
    }
   

    @Override
    public void insertarAtleta(Atleta op) {
        operadorRep.insertarAtleta(op);
    }

    @Override
    public void updateAtleta(Atleta op) {
        operadorRep.updateAtleta(op);
    }

    @Override
    public void executeUpateAtleta(Atleta op) {
        operadorRep.executeUpateAtleta(op);
    }

    @Override
    public void deleteAtleta(Atleta op) {
        operadorRep.deleteAtleta(op);
    }

}
