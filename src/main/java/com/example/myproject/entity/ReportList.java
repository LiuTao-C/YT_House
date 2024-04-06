package com.example.myproject.entity;


import jakarta.persistence.*;
import lombok.Data;

import java.io.Serializable;

@Data
@Entity
@Table(name = "reportlist")
public class ReportList implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    
    @Column
    private String type;
    
    @Column(name = "report_code")
    private String reportCode;
    
    @Column
    private String theme;
    
    @Column
    private String reportdate;
    
    
    @Column(name ="flight_number")
    private String filghtNumber;
    
    
    @Column
    private String position;
    
    
    @Column(name = "report_introduction")
    private String reportIntroduction;
    
    
    @Column(name = "event_type")
    private String eventType;
    
    
    @Column(name = "event_risk")
    private String eventRisk;
    
    @Column(name = "evaluation_date")
    private String evaluationDate;
    
    @Column
    private String evaluator;
    
    
    @Column
    private String conclusion;
    
    
    @Column(name = "final_confirmation")
    private String finalConfirmation;
    
    
    @Column(name = "need_research")
    private String needReaserch;
    
    @Column(name = "nedd_expert_research")
    private  String needExpertResearch;
    
}
