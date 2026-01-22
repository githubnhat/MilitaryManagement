package com.project.MilitaryManagement.entity;

import jakarta.persistence.*;
import lombok.*;
import lombok.experimental.FieldDefaults;

import java.util.List;

@Entity
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@FieldDefaults(level = AccessLevel.PRIVATE)

public class DaiDoi {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String tenDaiDoi;

    @ManyToOne
    @JoinColumn(name = "id_tieu_doan")
    private TieuDoan tieuDoan;

    @OneToMany(mappedBy = "daiDoi", cascade = CascadeType.ALL)
    private List<TrungDoi> dsTrungDoi;

    @Column
    private int status;
}
