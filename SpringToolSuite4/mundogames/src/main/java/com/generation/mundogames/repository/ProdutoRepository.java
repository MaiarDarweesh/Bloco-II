package com.generation.mundogames.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.generation.mundogames.model.Produto;

@Repository
public interface ProdutoRepository extends JpaRepository<Produto, Long>{

}
