/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.example.Atleta.model;

/**
 * La entidad Pais
 */
public class Pais {
    private String nombrePais;
    private boolean medallaOro;
    private boolean medallaPlata;
    private boolean medallaBronce;
    
    public Pais() {
        
    }

    public Pais(String nombrePais, boolean medallaOro, boolean medallaPlata, boolean medallaBronce) {
        this.nombrePais = nombrePais;
        this.medallaOro = medallaOro;
        this.medallaPlata = medallaPlata;
        this.medallaBronce = medallaBronce;
    }

    public String getNombrePais() {
        return nombrePais;
    }

    public void setNombrePais(String nombrePais) {
        this.nombrePais = nombrePais;
    }

    public boolean isMedallaOro() {
        return medallaOro;
    }

    public void setMedallaOro(boolean medallaOro) {
        this.medallaOro = medallaOro;
    }

    public boolean isMedallaPlata() {
        return medallaPlata;
    }

    public void setMedallaPlata(boolean medallaPlata) {
        this.medallaPlata = medallaPlata;
    }

    public boolean isMedallaBronce() {
        return medallaBronce;
    }

    public void setMedallaBronce(boolean medallaBronce) {
        this.medallaBronce = medallaBronce;
    }

    @Override
    public String toString() {
        return "Pais{" + "nombrePais=" + nombrePais + ", medallaOro=" + medallaOro + 
               ", medallaPlata=" + medallaPlata + ", medallaBronce=" + medallaBronce + '}';
    }
}
