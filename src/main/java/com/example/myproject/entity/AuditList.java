package com.example.myproject.entity;


import jakarta.persistence.*;
import java.io.Serializable;
//import lombok.Getter;
//import lombok.Setter;

@Entity
@Table(name = "auditlist")
public class AuditList implements Serializable {
    
    @Id
    private Long id;
    
    @Column
    private String code;
    
    @Column
    private String type;
    
    @Column
    private String position;
    
    @Column
    private String scope;
    
    @Column(name = "lead_auditor")
    private String leadAuditor;
    
    @Column
    private String auditors;
    
    @Column(name = "schedule_start_date")
    private String scheduleStartDate;
    
    // private CheckList checklist;
    
    // TODO setter getter 把Setter和Getter补充完， 可以用lombok
    
    
    public Long getId() {
        return id;
    }
    
    public void setId(Long id) {
        this.id = id;
    }
    
    public String getCode(){ return code;}
    
    public void setCode(String code){ this.code = code;}
    
    public String getType(){ return type;}
    public void setType(String type){ this.type = type;}
    
    public String getPosition(){ return position;}
    public void setPosition(String position){ this.code = position;}
    
    public String getScope(){ return scope;}
    public void setScope(String scope){ this.scope = scope;}
    
    public String getLeadAuditor(){ return leadAuditor;}
    public void setLeadAuditor(String leadAuditor){ this.leadAuditor = leadAuditor;}
    
    public String getAuditors(){ return auditors;}
    public void setAuditors(String auditors){ this.auditors = auditors;}
    
    public String getScheduleStartDate(){ return scheduleStartDate;}
    public void setScheduleStartDate(String scheduleStartDate){ this.scheduleStartDate = scheduleStartDate;}
    
    
}
