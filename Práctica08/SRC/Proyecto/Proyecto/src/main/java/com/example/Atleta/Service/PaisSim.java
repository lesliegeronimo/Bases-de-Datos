
/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.example.Atleta.Service;

import jakarta.annotation.Resource;
import java.util.List;
import org.springframework.stereotype.Service;

import com.example.Atleta.Repository.PaisRepositorio;
import com.example.Atleta.model.Pais;

/**
 *
 * @author 
 */
@Service
public class PaisSim implements PaisS{
    @Resource
    PaisRepositorio operadorRep;

    @Override
    public List<Pais> findAll() {
        return operadorRep.findAll();
    }
   

    @Override
    public void insertarPais(Pais op) {
        operadorRep.insertarPais(op);
    }

    @Override
    public void updatePais(Pais op) {
        operadorRep.updatePais(op);
    }

    @Override
    public void executeUpatePais(Pais op) {
        operadorRep.executeUpatePais(op);
    }

    @Override
    public void deletePais(Pais op) {
        operadorRep.deletePais(op);
    }

}
