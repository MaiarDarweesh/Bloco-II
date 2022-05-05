package com.Generation.farmacia.repository;

import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import com.Generation.farmacia.model.Produto;

@Repository
public interface ProdutoRepository extends JpaRepository<Produto, Long> {
	
}