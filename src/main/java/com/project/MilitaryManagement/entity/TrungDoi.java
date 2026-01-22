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

public class TrungDoi {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String tenTrungDoi;

    @ManyToOne
    @JoinColumn(name = "id_dai_doi")
    private DaiDoi daiDoi;

    @OneToMany(mappedBy = "trungDoi", cascade = CascadeType.ALL)
    private List<TieuDoi> dsTieuDoi;

    @Column
    private int status;
}
