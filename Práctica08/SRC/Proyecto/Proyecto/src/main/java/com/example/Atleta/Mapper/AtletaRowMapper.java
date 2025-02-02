/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.example.Atleta.Mapper;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import org.springframework.jdbc.core.RowMapper;

import com.example.Atleta.model.Atleta;

/**
 *
 * @author 
 */
public class AtletaRowMapper implements RowMapper<Atleta> {
    @Override
    public Atleta mapRow(ResultSet rs, int rowNum) throws SQLException {
        Atleta atleta = new Atleta();
        atleta.setIdAtleta(rs.getString("idatleta"));
        atleta.setNombre(rs.getString("nombre"));
        atleta.setApellidoP(rs.getString("apellidop"));
        atleta.setApellidoM(rs.getString("apellidom"));
        atleta.setNombrePais(rs.getString("nombrepais"));
        atleta.setDisciplina(rs.getString("disciplina"));
        atleta.setGenero(rs.getString("genero"));
        atleta.setFechaDeNacimiento(rs.getDate("fechadenacimiento"));
        atleta.setAnio(rs.getDate("año"));

        return atleta;
    }
}

