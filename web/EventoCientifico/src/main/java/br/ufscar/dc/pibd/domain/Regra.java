package br.ufscar.dc.pibd.domain;

public class Regra {
    public Long idEdital;
    public String descricao;
    public Byte modelo;

    public Regra(Long idEdital, String descricao, Byte modelo){
        this.idEdital = idEdital;
        this.descricao = descricao;
        this.modelo = modelo;
    }

    public Long getIdEdital(){
        return this.idEdital;
    }

    public void setIdEdital(Long idEdital){
        this.idEdital = idEdital;
    }

    public String getDescricao(){
        return this.descricao;
    }

    public void setDescricao(String descricao){
        this.descricao = descricao;
    }

    public Byte getModelo(){
        return this.modelo;
    }

    public void setModelo(Byte modelo){
        this.modelo = modelo;
    }
}
