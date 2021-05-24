/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.edu.fatecpg.web;
import java.util.ArrayList;

/**
 *
 * @author cutekah
 */
public class Database {
    private static ArrayList<User> users;
    
    public static ArrayList<User> getUsers(){
        if(users == null){
            users = new ArrayList<>();
            users.add(
                    new User(
                            "Administrador", 
                            "admin@domain.com", 
                            "1234".hashCode()
                    )
            );
            users.add(
                    new User(
                            "Fulano da Silva", 
                            "fulano@domain.com", 
                            "1234".hashCode()
                    )
            );
        }
        return users;
    }
    
    public static User getUser(String email){
        if(email == null) return null;
        for(User user: getUsers()){
            if(user.getEmail().equals(email)){
                return user;
            }
        }
        return null;
    }
    
    public static void addUser(User newUser){
        users.add(newUser);
    }
    
    public static void removeUser(String email){
        if(email == null) return;
        for(int i=0; i< users.size(); i++){
            if(users.get(i).getEmail().equals(email)){
                users.remove(i);
            }
        }
    }
    
    private static ArrayList<Contato> contatos;
    
    public static ArrayList<Contato> getContatos() {
        if(contatos == null) {
            contatos = new ArrayList<>();
            contatos.add(new Contato(
                    "Karina", 
                    "55 11 5555-0001", 
                    "karina@domain.com")
            );
            contatos.add(new Contato(
                    "Fulano", 
                    "55 13 5555-0002", 
                    "fulano@domain.com")
            );
        }        
        return contatos;
    }
    
    public static Contato getContato(String nome) {
        if(nome == null) return null;
        for(Contato contato: getContatos()) {
            if(contato.getName().equals(nome)) {
                return contato;
             }
        }
        return null;        
    }         
            
    public static void addContato(Contato newContato) {
        contatos.add(newContato);
    }   
    
    public static void removeContato(String nome) {
        if(nome == null) return;
        for(int i=0; i < contatos.size(); i++) {
            if(contatos.get(i).getName().equals(nome)) {
                contatos.remove((i));
            }
        }
    }
}