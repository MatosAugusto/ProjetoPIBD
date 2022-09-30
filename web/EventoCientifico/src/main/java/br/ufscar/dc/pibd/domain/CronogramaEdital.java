package br.ufscar.dc.pibd.domain;

import java.sql.Date;

public class CronogramaEdital {
    private Long idEdital;
    private Date dataPublicacaoOriginal;
    private String intervaloRealizacao;
    private Date dataDivulgacaoListaAprovados;
    

    public CronogramaEdital(Long idEdital, Date dataPublicacaoOriginal, String intervaloRealizacao, Date dataDivulgacaoListaAprovados){
        this.idEdital = idEdital;
        this.dataPublicacaoOriginal = dataPublicacaoOriginal;
        this.intervaloRealizacao = intervaloRealizacao;
        this.dataDivulgacaoListaAprovados = dataDivulgacaoListaAprovados;
    }

    public Long getIdEdital(){
        return this.idEdital;
    }

    public void setIdEdital(Long idEdital){
        this.idEdital = idEdital;
    }

    public String getIntervaloRealizacao(){
        return this.intervaloRealizacao;
    }

    public void setIntervaloRealizacao(String intervaloRealizacao){
        this.intervaloRealizacao = intervaloRealizacao;
    }

    public Date getDataDivulgacaoListaAprovados(){
        return this.dataDivulgacaoListaAprovados;
    }

    public void setDataDivulgacaoListaAprovados(Date dataDivulgacaoListaAprovados){
        this.dataDivulgacaoListaAprovados = dataDivulgacaoListaAprovados;
    }

    public Date getDataPublicacaoOriginal(){
        return this.dataPublicacaoOriginal;
    }

    public void setDataPublicacaoOriginal(Date dataPublicacaoOriginal){
        this.dataPublicacaoOriginal = dataPublicacaoOriginal;
    }
}
