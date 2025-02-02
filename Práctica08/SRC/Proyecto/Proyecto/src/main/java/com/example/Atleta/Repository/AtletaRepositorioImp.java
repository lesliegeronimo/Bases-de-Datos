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

import com.example.Atleta.Mapper.AtletaRowMapper;
import com.example.Atleta.model.Atleta;

/**
 *
 * @author
 */
@Repository
public class AtletaRepositorioImp implements AtletaRepositorio{

    NamedParameterJdbcTemplate template;
    
    public AtletaRepositorioImp(NamedParameterJdbcTemplate template){
        this.template = template;
    }
    @Override
    public List<Atleta> findAll() {
        return template.query("SELECT * FROM atleta", new AtletaRowMapper());
    }


    @Override
    public void insertarAtleta(Atleta op) {
        final String sql = "INSERT INTO atleta (idatleta, nombre, apellidop, apellidom, nombrepais, disciplina, fechadenacimiento, año, genero) "
                         + "VALUES (:id, :nombre, :apellidoP, :apellidoM, :nombrepais, :disciplina, :fechadenacimiento, :año, :genero)";

        KeyHolder holder = new GeneratedKeyHolder();
        SqlParameterSource param = new MapSqlParameterSource()
                .addValue("id", op.getIdAtleta())
                .addValue("nombre", op.getNombre())
                .addValue("apellidoP", op.getApellidoP()) 
                .addValue("apellidoM", op.getApellidoM()) 
                .addValue("nombrepais", op.getNombrePais()) 
                .addValue("disciplina", op.getDisciplina())
                .addValue("fechadenacimiento", op.getFechaDeNacimiento()) 
                .addValue("año", op.getAnio()) 
                .addValue("genero", op.getGenero());
        template.update(sql, param, holder);
    }
    

    @Override
    public void updateAtleta(Atleta op) {
        final String sql = "UPDATE atleta SET nombre=:nombre, apellidop=:apellidoP, apellidom=:apellidoM, "
                         + "nombrepais=:nombrepais, disciplina=:disciplina, fechadenacimiento=:fechanacimiento, año=:año, "
                         + "genero=:genero WHERE idatleta=:id";

        KeyHolder holder = new GeneratedKeyHolder();
        SqlParameterSource param = new MapSqlParameterSource()
                .addValue("id", op.getIdAtleta())
                .addValue("nombre", op.getNombre())
                .addValue("apellidoP", op.getApellidoP())
                .addValue("apellidoM", op.getApellidoM())
                .addValue("nombrepais", op.getNombrePais()) 
                .addValue("disciplina", op.getDisciplina())
                .addValue("fechanacimiento", op.getFechaDeNacimiento()) 
                .addValue("año", op.getAnio()) 
                .addValue("genero", op.getGenero());
        template.update(sql, param, holder);
    }

    @Override
    public void executeUpateAtleta(Atleta op) {
        
        final String sql = "UPDATE Atleta SET id=:id,"
                    + "nombre=:nombre,apellidop=:apellidoP,"
                + "apellidom=:apellidoM,"
                    + ",pais=:pais,disciplina=:disciplina,"
                    + "fechadenacimiento=:fechaNacimiento,año=:anio,"
                + "genero=:genero "
                + "WHERE idatleta=:id";
            
        Map<String,Object> map = new HashMap<String,Object>();
                map.put("id", op.getIdAtleta());
                map.put("nombre", op.getNombre());
                map.put("apellidoPaterno", op.getApellidoP());
                map.put("apellidoMaterno", op.getApellidoM());
                map.put("pais", op.getNombrePais());
                map.put("disciplina", op.getDisciplina());
                map.put("fechaNacimiento", op.getFechaDeNacimiento());
                map.put("anio", op.getAnio());
                map.put("genero", op.getGenero());
               
                template.execute(sql,map,new PreparedStatementCallback<Object>(){
                    @Override
                    public Object doInPreparedStatement(PreparedStatement ps)
                            throws SQLException, DataAccessException{
                        return ps.executeUpdate();
                    }
                    
                });
        
    }

    @Override
    public void deleteAtleta(Atleta op) {
        final String sql = "DELETE FROM atleta WHERE idatleta=:id"; 
        Map<String, Object> map = new HashMap<>();
        map.put("id", op.getIdAtleta());
        template.execute(sql, map, new PreparedStatementCallback<Object>() {
            @Override
            public Object doInPreparedStatement(PreparedStatement ps)
                    throws SQLException, DataAccessException {
                return ps.executeUpdate();
            }
        });
    }
    
}
