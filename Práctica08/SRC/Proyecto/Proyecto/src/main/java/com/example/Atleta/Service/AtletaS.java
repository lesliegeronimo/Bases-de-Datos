/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.example.Atleta.Service;

import java.util.List;

import com.example.Atleta.model.Atleta;

/**
 *
 * @author ricardo
 */
public interface AtletaS {
    List<Atleta> findAll();
    void insertarAtleta(Atleta op);
    void updateAtleta(Atleta op);
    void executeUpateAtleta(Atleta op);
    void deleteAtleta(Atleta op);
}

