/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.example.Atleta.Repository;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.PreparedStatementCallback;
import org.springframework.jdbc.core.PreparedStatementSetter;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.jdbc.core.namedparam.SqlParameterSource;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.stereotype.Repository;


import com.example.Atleta.Mapper.PaisRowMapper;
import com.example.Atleta.model.Pais;


/**
 *
 * @author
 */
@Repository
public class PaisRepositorioImp implements PaisRepositorio{

    NamedParameterJdbcTemplate template;
    
    public PaisRepositorioImp(NamedParameterJdbcTemplate template){
        this.template = template;
    }
    @Override
    public List<Pais> findAll() {
        return template.query("SELECT * FROM Pais", new PaisRowMapper());
    }

    @Override
    public void insertarPais(Pais op) {
        try {
            final String sql = "INSERT INTO Pais(nombrepais, medallaoro, medallaplata, medallabronce) "
                            + "VALUES (:nombrePais, :medallaOro, :medallaPlata, :medallaBronce)";
            KeyHolder holder = new GeneratedKeyHolder();
            SqlParameterSource param = new MapSqlParameterSource()
                    .addValue("nombrePais", op.getNombrePais())
                    .addValue("medallaOro", op.isMedallaOro())
                    .addValue("medallaPlata", op.isMedallaPlata())
                    .addValue("medallaBronce", op.isMedallaBronce());
            template.update(sql, param, holder);
        } catch (Exception e) {
            e.printStackTrace(); 
        }
    }

    

    @Override
    public void updatePais(Pais op) {
        final String sql = "UPDATE Pais SET nombrepais=:nombrePais, "
                        + "medallaoro=:medallaOro, "
                        + "medallaplata=:medallaPlata, "
                        + "medallabronce=:medallaBronce "
                        + "WHERE nombrepais=:nombrePais";

        KeyHolder holder = new GeneratedKeyHolder();
        SqlParameterSource param = new MapSqlParameterSource()
                .addValue("nombrePais", op.getNombrePais())
                .addValue("medallaOro", op.isMedallaOro())
                .addValue("medallaPlata", op.isMedallaPlata())
                .addValue("medallaBronce", op.isMedallaBronce());

        template.update(sql, param, holder);
    }


    @Override
    public void executeUpatePais(Pais op) {
        
        final String sql = "UPDATE Pais SET nombrePais=:nombrePais,"
                + "isMedallaOro=:isMedallaOro,"
                    + "isMedallaPlata=:isMedallaPlata"
                + "isMedallaBronce=:isMedallaBronce "
                + "WHERE nombrePais=:nombrePais";
            
        Map<String,Object> map = new HashMap<String,Object>();
                map.put("nombrePais", op.getNombrePais());
                map.put("isMedallaOro", op.isMedallaOro());
                map.put("isMedallaPlata", op.isMedallaPlata());
                map.put("isMedallaBronce", op.isMedallaBronce());
               
                template.execute(sql,map,new PreparedStatementCallback<Object>(){
                    @Override
                    public Object doInPreparedStatement(PreparedStatement ps)
                            throws SQLException, DataAccessException{
                        return ps.executeUpdate();
                    }
                    
                });
        
    }

    @Override
    public void deletePais(Pais op) {
        try {
            final String sql = "DELETE FROM Pais WHERE nombrepais = :nombrePais"; 
            Map<String, Object> map = new HashMap<>();
            map.put("nombrePais", op.getNombrePais()); 
            template.execute(sql, map, new PreparedStatementCallback<Object>() {
                @Override
                public Object doInPreparedStatement(PreparedStatement ps) throws SQLException, DataAccessException {
                    return ps.executeUpdate();
                }
            });
        } catch (Exception e) {
            e.printStackTrace(); 
        }
    }

    
}
