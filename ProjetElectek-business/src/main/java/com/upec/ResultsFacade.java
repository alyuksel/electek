/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.upec;

import com.upec.entities.Results;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author drajasin
 */
@Stateless
public class ResultsFacade extends AbstractFacade<Results> {

    @PersistenceContext(unitName = "com.upec_ProjetElectek")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public ResultsFacade() {
        super(Results.class);
    }
    
}
