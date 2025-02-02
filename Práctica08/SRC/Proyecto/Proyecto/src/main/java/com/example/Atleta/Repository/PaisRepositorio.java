/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.example.Atleta.Repository;

import java.util.List;

import com.example.Atleta.Service.PaisS;
import com.example.Atleta.model.Pais;

/**
 * 
 * @author 
 */
public interface PaisRepositorio{
    List<Pais> findAll();
    void insertarPais(Pais op);
    void updatePais(Pais op);
    void executeUpatePais(Pais op);
    public void deletePais(Pais op);
}
