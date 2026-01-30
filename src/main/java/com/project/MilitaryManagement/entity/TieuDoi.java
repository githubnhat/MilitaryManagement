package com.project.MilitaryManagement.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
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
    @OneToMany(mappedBy = "tieuDoi")
    @ToString.Exclude // Ngăn không cho gọi toString của danh sách QuanNhan
    @JsonIgnore
    private List<QuanNhan> dsQuanNhan;

    @Column
    private int status;
}
