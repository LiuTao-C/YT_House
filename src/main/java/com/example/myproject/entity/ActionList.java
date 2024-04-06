package com.example.myproject.entity;


import io.smallrye.common.constraint.NotNull;
import jakarta.persistence.*;
import lombok.Data;

import java.io.Serializable;

@Data
@Entity
@Table(name = "actionlist")
public class ActionList implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    
    @Column(name = "actcode")
    private String actCode;
    
    @Column
    private String investors;
    
    @Column(name = "create_date")
    private String createDate;
    
    @Column(name = "project_scope")
    private String projectScope;
    
    @Column
    private String standards;
    
    @Column(name = "schedule_start_date")
    private String scheduleStartDate;
    
    @Column(name = "schedule_end_date")
    private String scheduleEndDate;
    
    @Column
    private String position;
    
    @Column
    private String status;
    
    @Column(name = "detail_information")
    private String detailInformation;
    
    @Column
    private  String risk;
    
    @Column(name = "action_cycle")
    private  String actionCycle;
    
    @Column(name = "department_collaboration")
    private String departmentCollaboration;
    
    @Column(name = "assessment_conclusion")
    private String assessmentConclusion;
    
    @Column(name = "corrective_measures")
    private String correctiveMeasures;
    
    
    
}
