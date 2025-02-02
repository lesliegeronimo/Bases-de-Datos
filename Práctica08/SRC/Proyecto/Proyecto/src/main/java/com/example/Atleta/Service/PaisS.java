/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.example.Atleta.Service;

import java.util.List;

import com.example.Atleta.model.Pais;

/**
 *
 * @author 
 */
public interface PaisS {
    List<Pais> findAll();
    void insertarPais(Pais op);
    void updatePais(Pais op);
    void executeUpatePais(Pais op);
    void deletePais(Pais op);
}

