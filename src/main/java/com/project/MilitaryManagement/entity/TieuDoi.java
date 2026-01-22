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

public class TieuDoi {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String tenTieuDoi;

    @ManyToOne
    @JoinColumn(name = "id_trung_doi")
    private TrungDoi trungDoi;
    @OneToMany(mappedBy = "tieuDoi", cascade = CascadeType.ALL)
    private List<QuanNhan> dsQuanNhan;
}
