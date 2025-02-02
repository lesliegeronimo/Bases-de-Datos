/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.example.Atleta.model;

/**
 * La entidad Atleta
 */
public class Atleta {
    private String idAtleta;
    private String nombrePais;
    private String disciplina;
    private String genero; // Solo "Masculino" o "Femenino"
    private String nombre;
    private String apellidoP;
    private String apellidoM;
    private java.sql.Date fechaDeNacimiento;
    private java.sql.Date anio;
    
    public Atleta() {
        
    }

    public Atleta(String idAtleta, String nombrePais, String disciplina, String genero, 
                  String nombre, String apellidoP, String apellidoM, 
                  java.sql.Date fechaDeNacimiento, java.sql.Date anio) {
        this.idAtleta = idAtleta;
        this.nombrePais = nombrePais;
        this.disciplina = disciplina;
        this.genero = genero;
        this.nombre = nombre;
        this.apellidoP = apellidoP;
        this.apellidoM = apellidoM;
        this.fechaDeNacimiento = fechaDeNacimiento;
        this.anio = anio;
    }

    public String getIdAtleta() {
        return idAtleta;
    }

    public void setIdAtleta(String idAtleta) {
        this.idAtleta = idAtleta;
    }

    public String getNombrePais() {
        return nombrePais;
    }

    public void setNombrePais(String nombrePais) {
        this.nombrePais = nombrePais;
    }

    public String getDisciplina() {
        return disciplina;
    }

    public void setDisciplina(String disciplina) {
        this.disciplina = disciplina;
    }

    public String getGenero() {
        return genero;
    }

    public void setGenero(String genero) {
        this.genero = genero;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellidoP() {
        return apellidoP;
    }

    public void setApellidoP(String apellidoP) {
        this.apellidoP = apellidoP;
    }

    public String getApellidoM() {
        return apellidoM;
    }

    public void setApellidoM(String apellidoM) {
        this.apellidoM = apellidoM;
    }

    public java.sql.Date getFechaDeNacimiento() {
        return fechaDeNacimiento;
    }

    public void setFechaDeNacimiento(java.sql.Date fechaDeNacimiento) {
        this.fechaDeNacimiento = fechaDeNacimiento;
    }

    public java.sql.Date getAnio() {
        return anio;
    }

    public void setAnio(java.sql.Date anio) {
        this.anio = anio;
    }

    @Override
    public String toString() {
        return "Atleta{" + "idAtleta=" + idAtleta + ", nombrePais=" + nombrePais + 
               ", disciplina=" + disciplina + ", genero=" + genero + ", nombre=" + nombre + 
               ", apellidoP=" + apellidoP + ", apellidoM=" + apellidoM + 
               ", fechaDeNacimiento=" + fechaDeNacimiento + ", anio=" + anio + '}';
    }
}
