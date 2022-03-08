/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import dbtable.DBTable;
import java.util.Date;

/**
 *
 * @author P14A-Fanjava
 */
public class Etudiant  extends DBTable{
    String id;
    String nom;
    Date dateNaissance;
    String promotion;

    public Date getDateNaissance() {
        return dateNaissance;
    }

    public void setDateNaissance(Date dateNaissance) {
        this.dateNaissance = dateNaissance;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }



    public String getPromotion() {
        return promotion;
    }

    public void setPromotion(String promotion) {
        this.promotion = promotion;
    }
    public int getAge(){
        Date d=new Date();
        int y=d.getYear()+1900;
        int y2=dateNaissance.getYear();
        return y-y2;
    }
    
}
