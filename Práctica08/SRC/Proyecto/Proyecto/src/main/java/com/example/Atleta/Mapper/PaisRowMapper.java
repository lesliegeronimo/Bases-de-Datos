/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.example.Atleta.Mapper;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import org.springframework.jdbc.core.RowMapper;

import com.example.Atleta.model.Pais;

/**
 *
 * @author 
 */
public class PaisRowMapper implements RowMapper<Pais>{

    @Override
    public Pais mapRow(ResultSet rs, int rowNum) throws SQLException {
        Pais op = new Pais();
        op.setNombrePais(rs.getString("nombrepais")); // Correcto
        op.setMedallaOro(rs.getBoolean("medallaoro")); // Correcto
        op.setMedallaPlata(rs.getBoolean("medallaplata")); // Correcto
        op.setMedallaBronce(rs.getBoolean("medallabronce")); // Correcto

        
        return op;       
    }
}
