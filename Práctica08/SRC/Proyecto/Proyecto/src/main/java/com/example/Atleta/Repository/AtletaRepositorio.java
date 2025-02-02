/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.example.Atleta.Repository;

import java.util.List;

import com.example.Atleta.model.Atleta;

/**
 * 
 * @author ricardo
 */
public interface AtletaRepositorio{
    List<Atleta> findAll();
    void insertarAtleta(Atleta op);
    void updateAtleta(Atleta op);
    void executeUpateAtleta(Atleta op);
    public void deleteAtleta(Atleta op);
}
